require "./test/test_helper"

class MessagesTest < Minitest::Test
  def test_prints_start_message
    welcome_message = "Welcome to BATTLESHIP"
    welcome_message += "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"

    assert_equal welcome_message, Messages.welcome_message
  end

  def test_instructions
    instructions = "This is how you play the game."
    assert_equal instructions, Messages.instructions
  end

  def test_quit
    assert_equal "Goodbye!", Messages.quit
  end

  def test_prompt_player_ship_placement
    prompt = ""
    prompt += "I have laid out my ships on the grid."
    prompt += "You now need to layout your two ships."
    prompt += "The first is two units long and the
    second is three units long."
    prompt += "The grid has A1 at the top left and D4 at the bottom right."
    prompt += "\n"
    prompt += "Enter the squares for the two-unit ship:"

    assert_equal prompt, Messages.prompt_player_ship_placement
  end

  def test_prompt_three_unit
    prompt = "Enter the squares for the three-unit ship:"

    assert_equal prompt, Messages.prompt_three_unit
  end

  def test_prompt_player_ship_shot
    prompt = ""
    prompt += "\n\n+++++++++++++++++++++++++++++++++"
    prompt += "\n\nWhich position should we fire at?\n\n"
    prompt += "+++++++++++++++++++++++++++++++++\n\n"

    assert_equal prompt, Messages.prompt_player_shot
  end

  def test_end_game
    assert_equal "Game Over", Messages.end_game
  end
end
