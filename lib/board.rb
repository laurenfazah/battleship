class Board
  attr_accessor :computer_board,
                :computer_placements,
                :player_board,
                :player_placements

  def initialize
    @computer_board = generate_computer_board
    @computer_placements = [["A1", "A2"], ["B1", "B2", "B3"]]
    @player_board = base_grid
    @player_placements = []
  end

  def generate_computer_board
    comp_board = base_grid
    two_unit = ["A1", "A2"]
    place_ships(two_unit, comp_board)
    three_unit = ["B1", "B2", "B3"]
    place_ships(three_unit, comp_board)
    comp_board
  end

  def place_ships(choices, board)
    if validate_placements(choices, board)
      choices.each do |choice|
        find_square(choice, board)[:ship] = true
      end
    end
  end

  def print_board(board)
    printed_board = ""
    printed_board += "===========\n"
    printed_board += ". 1 2 3 4\n"
    board.each_with_index do |row, index|
      printed_board += print_row(row, row_index_lookup[index])
    end
    printed_board += "==========="
  end

  def print_row(row, letter)
    square_stats = row.map do |square|
      hit_or_miss(square)
    end

    "#{letter} #{square_stats.join(' ')}\n"
  end

  def row_index_lookup
    %W(A B C D)
  end

  def hit_or_miss(square)
    if square[:guessed] && square[:ship]
      "H"
    elsif square[:guessed]
      "M"
    else
      " "
    end
  end

  def base_grid
    [
      [{position: "A1", guessed: false, ship: false}, {position: "A2", guessed: false, ship: false}, {position: "A3", guessed: false, ship: false}, {position: "A4", guessed: false, ship: false}],
      [{position: "B1", guessed: false, ship: false}, {position: "B2", guessed: false, ship: false}, {position: "B3", guessed: false, ship: false}, {position: "B4", guessed: false, ship: false}],
      [{position: "C1", guessed: false, ship: false}, {position: "C2", guessed: false, ship: false}, {position: "C3", guessed: false, ship: false}, {position: "C4", guessed: false, ship: false}],
      [{position: "D1", guessed: false, ship: false}, {position: "D2", guessed: false, ship: false}, {position: "D3", guessed: false, ship: false}, {position: "D4", guessed: false, ship: false}]
    ]
  end

  def valid_coordinates
    base_grid.flatten.map { |square| square[:position] }
  end

  def valid_coordinate?(coord)
    valid_coordinates.include?(coord)
  end

  def valid_horizontally?(placements)
    letters = placements.map { |coord| coord[0] }
    nums = placements.map { |coord| coord[-1].to_i }
    return false unless letters.all? { |coord| coord == letters[0] }
    return false unless array_increments?(nums)
    true
  end

  def valid_vertically?(placements)
    letters = placements.map { |coord| coord[0] }
    nums = placements.map { |coord| coord[-1].to_i }
    return false unless nums.all? { |coord| coord == nums[0] }
    return false unless array_increments?(letters)
    true
  end

  def array_increments?(array)
    sorted = array.sort
    last = sorted[0]
    sorted[1, sorted.count].each do |n|
      return false if last.next != n
      last = n
    end
    true
  end

  def no_overlap?(placements, board)
    return true unless placements.any? do |coord|
      find_square(coord, board)[:ship] == true
    end
  end

  def find_square(coord, board)
    row_index = row_index_lookup.index(coord.chars[0])
    board[row_index][coord.chars[1].to_i-1]
  end

  def validate_placements(placements, board)
    return false unless placements.all? { |coord| valid_coordinate?(coord) }
    return false unless valid_horizontally?(placements) || valid_vertically?(placements)
    return false unless no_overlap?(placements, board)
    true
  end

  def aim_fire(coord, board)
    # validate_shot
    square = find_square(coord, board)
    square[:guessed] = true
    if square[:ship]
      puts "Hit!"
    else
      puts "Miss!"
    end
  end

  def check_game_over
    [player_board, computer_board].each_with_index do |board, index|
      case index
      when 0
        return true if player_placements.all? do |ship|
          ship.all? do |coord|
            square = find_square(coord, player_board)
            square[:guessed] && square[:ship]
          end
        end
      when 1
        return true if computer_placements.all? do |ship|
          ship.all? do |coord|
            square = find_square(coord, computer_board)
            square[:guessed] && square[:ship]
          end
        end
      end
    end
    false
  end
end
