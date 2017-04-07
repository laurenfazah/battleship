require "./test/test_helper.rb"

class BattleshipTest < Minitest::Test
  attr_reader :battleship, :instructions

  def setup
    @battleship = Battleship.new
  end

  def test_it_exists
    assert_instance_of Battleship, battleship
  end
end
