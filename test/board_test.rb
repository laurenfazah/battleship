require './test/test_helper'

class BoardTest < Minitest::Test
  attr_reader :board

  def setup
    @board = Board.new
  end

  def test_it_exists
    assert_instance_of Board, board
  end

  def test_lay_comp_ships

  end

  def test_base_grid
    base_grid = [
      [{position: "A1"}, {position: "A2"}, {position: "A3"}, {position: "A4"}],
      [{position: "B1"}, {position: "B2"}, {position: "B3"}, {position: "B4"}],
      [{position: "C1"}, {position: "C2"}, {position: "C3"}, {position: "C4"}],
      [{position: "D1"}, {position: "D2"}, {position: "D3"}, {position: "D4"}]
    ]
    assert_equal base_grid, board.base_grid
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
end
