class Battleship
  def run
    welcome_message
    # start_input = gets.chomp
    # start_from_input(start_input)
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
#     Ships cannot wrap around the board
# Ships cannot overlap
# Ships can be laid either horizontally or vertically
# Coordinates must correspond to the first and last units of the ship. (IE: You can’t place a two unit ship at “A1 A3”)

    # Board.lay_computer_ships

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
end

Battleship.new.run
