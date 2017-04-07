require "./test/test_helper.rb"

class BattleshipTest < Minitest::Test
  attr_reader :battleship, :instructions

  def setup
    @battleship = Battleship.new
    @instructions = "This is how you play the game."
  end

  def test_it_exists
    assert_instance_of Battleship, battleship
  end

  def test_prints_start_message
    welcome_message = "Welcome to BATTLESHIP"
    welcome_message += "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"

    assert_equal welcome_message, battleship.welcome_message
  end

  def test_instructions
    assert_equal instructions, battleship.instructions
  end

  def test_start_from_input_with_p

  end

  def test_start_from_input_with_i
    assert_equal instructions, battleship.start_from_input("i")
  end

  def test_prompt_player_ship_shot
    prompt = ""
    prompt += "\n\n+++++++++++++++++++++++++++++++++"
    prompt += "\n\nWhich position should we fire at?\n\n"
    prompt += "+++++++++++++++++++++++++++++++++\n\n"

    assert_equal prompt, battleship.prompt_player_shot
  end
end
