require "./test/test_helper"

class BoardTest < Minitest::Test
  attr_reader :board, :base_grid

  def setup
    @board = Board.new
    @base_grid = [
      [{:position=>"A1", :guessed=>false, :ship=>false}, {:position=>"A2", :guessed=>false, :ship=>false}, {:position=>"A3", :guessed=>false, :ship=>false}, {:position=>"A4", :guessed=>false, :ship=>false}],
      [{:position=>"B1", :guessed=>false, :ship=>false}, {:position=>"B2", :guessed=>false, :ship=>false}, {:position=>"B3", :guessed=>false, :ship=>false}, {:position=>"B4", :guessed=>false, :ship=>false}],
      [{:position=>"C1", :guessed=>false, :ship=>false}, {:position=>"C2", :guessed=>false, :ship=>false}, {:position=>"C3", :guessed=>false, :ship=>false}, {:position=>"C4", :guessed=>false, :ship=>false}],
      [{:position=>"D1", :guessed=>false, :ship=>false}, {:position=>"D2", :guessed=>false, :ship=>false}, {:position=>"D3", :guessed=>false, :ship=>false}, {:position=>"D4", :guessed=>false, :ship=>false}]
    ]
  end

  def test_it_exists
    assert_instance_of Board, board
  end

  def test_valid_coordinates
    valid_coords = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    assert_equal valid_coords, board.valid_coordinates
  end

  def test_valid_coordinate
    assert board.valid_coordinate?("A1")
    assert board.valid_coordinate?("D4")
    refute board.valid_coordinate?("A5")
    refute board.valid_coordinate?("E1")
  end

  def test_computer_board
    assert_instance_of Array, board.computer_board
  end

  def test_player_board
    assert_instance_of Array, board.computer_board
  end

  def test_print_board
    printed_board = ""
    printed_board += "===========\n"
    printed_board += ". 1 2 3 4\n"
    printed_board += "A        \n"
    printed_board += "B        \n"
    printed_board += "C        \n"
    printed_board += "D        \n"
    printed_board += "==========="

    assert_equal printed_board, board.print_board(board.computer_board)
  end

  def test_print_board_with_shots
    coord = "A1"
    coord_2 = "D1"

    board.aim_fire(coord, board.computer_board, "Player")
    board.aim_fire(coord_2, board.computer_board, "Player")

    printed_board = ""
    printed_board += "===========\n"
    printed_board += ". 1 2 3 4\n"
    printed_board += "A H      \n"
    printed_board += "B        \n"
    printed_board += "C        \n"
    printed_board += "D M      \n"
    printed_board += "==========="

    assert_equal printed_board, board.print_board(board.computer_board)
  end

  def test_place_two_ships
    two_unit = ["A1", "A2"]

    assert_equal base_grid, board.player_board

    board.place_ships(two_unit, board.player_board)

    refute_equal base_grid, board.player_board
  end

  def test_place_three_ships
    three_unit = ["B1", "B2", "B3"]
    assert_equal base_grid, board.player_board

    board.place_ships(three_unit, board.player_board)

    refute_equal base_grid, board.player_board
  end

  def test_valid_horizontally
    three_unit = ["B1", "B2", "B3"]
    bad = ["B1", "B4", "B3"]

    assert board.valid_horizontally?(three_unit)
    refute board.valid_horizontally?(bad)
  end

  def test_valid_vertically
    three_unit = ["A1", "B1", "C1"]
    bad = ["A1", "B1", "D1"]

    assert board.valid_vertically?(three_unit)
    refute board.valid_vertically?(bad)
  end

  def test_no_overlap
    two_unit = ["A1", "A2"]
    three_unit = ["B1", "B2", "B3"]
    bad_three_unit = ["A2", "B2", "C2"]

    board.place_ships(two_unit, board.player_board)

    assert board.validate_placements(three_unit, board.player_board)
    refute board.validate_placements(bad_three_unit, board.player_board)
  end

  def test_validate_placements

    two_unit = ["A1", "A2"]
    three_unit = ["B1", "B2", "B3"]
    another_three_unit = ["B4", "B2", "B3"]

    bad_1 = ["H1", "B2", "B3"]
    bad_2 = ["B1", "B4", "B3"]

    assert board.validate_placements(two_unit, board.player_board)
    assert board.validate_placements(three_unit, board.player_board)
    assert board.validate_placements(another_three_unit, board.player_board)

    refute board.validate_placements(bad_1, board.player_board)
    refute board.validate_placements(bad_2, board.player_board)
  end

  def test_aim_fire
    coord = "A1"
    square = board.find_square(coord, board.computer_board)

    refute square[:guessed]

    board.aim_fire(coord, board.computer_board, "Player")

    assert square[:guessed]
  end

  def test_computer_shot
    board.computer_shot_options = board.valid_coordinates

    assert_equal 16, board.computer_shot_options.count

    board.computer_shot

    assert_equal 15, board.computer_shot_options.count

    board.computer_shot

    assert_equal 14, board.computer_shot_options.count
  end

  def test_game_over

    board.computer_placements = [%W(A1 A2), %W(B2 C2 D2)]
    board.player_placements = [%W(A3 A2), %W(B1 C1 D1)]

    refute board.check_game_over

    board.computer_board = [
      [{:position=>"A1", :guessed=>true, :ship=>true}, {:position=>"A2", :guessed=>true, :ship=>true}, {:position=>"A3", :guessed=>false, :ship=>false}, {:position=>"A4", :guessed=>false, :ship=>false}],
      [{:position=>"B1", :guessed=>false, :ship=>false}, {:position=>"B2", :guessed=>true, :ship=>true}, {:position=>"B3", :guessed=>false, :ship=>false}, {:position=>"B4", :guessed=>false, :ship=>false}],
      [{:position=>"C1", :guessed=>false, :ship=>false}, {:position=>"C2", :guessed=>true, :ship=>true}, {:position=>"C3", :guessed=>false, :ship=>false}, {:position=>"C4", :guessed=>false, :ship=>false}],
      [{:position=>"D1", :guessed=>false, :ship=>false}, {:position=>"D2", :guessed=>true, :ship=>true}, {:position=>"D3", :guessed=>false, :ship=>false}, {:position=>"D4", :guessed=>false, :ship=>false}]
    ]

    assert board.check_game_over
  end
end
