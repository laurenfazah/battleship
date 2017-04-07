require "./lib/board"
require './lib/messages_module'
require "pry"

class Battleship
  include Messages
  attr_reader :board, :game_over

  def initialize
    @board = nil
    @game_over = false
  end

  def run
    puts welcome_message
    start_input = gets.chomp
    start_from_input(start_input)
  end

  def start_from_input(input)
    case input.downcase
    when "p" || "play"
      play_game
    when "i" || "instructions"
      instructions
    when "q" || "quit"
      puts quit
      exit
    end
  end

  def play_game
    @board = Board.new
    placement_sequence
    shoot
    puts end_game
    exit
  end

  def placement_sequence
    puts prompt_player_ship_placement
    two_unit = gets_player_ship_placement
    puts prompt_three_unit
    three_unit = gets_player_ship_placement
    puts board.print_board(board.computer_board)
    board.player_placements = [two_unit, three_unit]
  end

  def gets_player_ship_placement
    coords = gets.chomp.upcase.split
    board.place_ships(coords, board.player_board)
  end

  def shoot
    until game_over
      puts prompt_player_shot
      gets_player_shot
      puts board.print_board(board.computer_board)
      check_game_over_player
      puts board.computer_shot
      check_game_over_computer
    end
  end

  def check_game_over_player
    if @game_over = board.check_game_over
      puts "You win!"
      exit
    end
  end

  def check_game_over_computer
    if @game_over = board.check_game_over
      puts "Computer sunk your ships!"
      exit
    end
  end

  def gets_player_shot
    coord = gets.chomp.upcase
    board.aim_fire(coord, board.computer_board, "You")
  end
end
