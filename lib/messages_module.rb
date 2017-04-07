module Messages
  def self.welcome_message
    message = "Welcome to BATTLESHIP"
    message += "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def self.instructions
    "This is how you play the game."
  end

  def self.quit
    "Goodbye!"
  end

  def self.prompt_player_ship_placement
    prompt = ""
    prompt += "I have laid out my ships on the grid."
    prompt += "You now need to layout your two ships."
    prompt += "The first is two units long and the
    second is three units long."
    prompt += "The grid has A1 at the top left and D4 at the bottom right."
    prompt += "\n"
    prompt += "Enter the squares for the two-unit ship:"
  end

  def self.prompt_three_unit
    "Enter the squares for the three-unit ship:"
  end

  def self.prompt_player_shot
    prompt = ""
    prompt += "\n\n+++++++++++++++++++++++++++++++++"
    prompt += "\n\nWhich position should we fire at?\n\n"
    prompt += "+++++++++++++++++++++++++++++++++\n\n"
  end

  def self.end_game
    "Game Over"
  end
end
