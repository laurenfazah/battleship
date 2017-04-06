require './lib/board'
require "pry"

class Battleship
  attr_reader :board

  def initialize
    @board = nil
  end

  def run
    puts welcome_message
    start_input = gets.chomp
    start_from_input(start_input)
  end

  def welcome_message
    message = "Welcome to BATTLESHIP"
    message += "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def start_from_input(char)
    case char
    when "p"
      play_game
    when "i"
      instructions
    when "q"
      quit
    end
  end

  def play_game
    @board = Board.new
    puts prompt_player_ship_placement
    gets_player_ship_placement
    puts prompt_three_unit
    gets_player_ship_placement
    binding.pry
  end

  def instructions
    "This is how you play the game."
  end

  def quit
    "Goodbye!"
  end

  def prompt_player_ship_placement
    prompt = ""
    prompt += "I have laid out my ships on the grid."
    prompt += "You now need to layout your two ships."
    prompt += "The first is two units long and the
second is three units long."
    prompt += "The grid has A1 at the top left and D4 at the bottom right."
    prompt += "\n"
    prompt += "Enter the squares for the two-unit ship:"
  end

  def prompt_three_unit
    "Enter the squares for the three-unit ship:"
  end

  def gets_player_ship_placement
    coords = gets.chomp.upcase.split
    board.place_ships(coords, board.player_board)
  end
end

# Battleship.new.run
