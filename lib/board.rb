class Board
  def create_grid

  end
  def lay_computer_ships
#     Ships cannot wrap around the board
# Ships cannot overlap
# Ships can be laid either horizontally or vertically
# Coordinates must correspond to the first and last units of the ship. (IE: You can’t place a two unit ship at “A1 A3”)
  end

  def base_grid
    [
      [{position: "A1"}, {position: "A2"}, {position: "A3"}, {position: "A4"}],
      [{position: "B1"}, {position: "B2"}, {position: "B3"}, {position: "B4"}],
      [{position: "C1"}, {position: "C2"}, {position: "C3"}, {position: "C4"}],
      [{position: "D1"}, {position: "D2"}, {position: "D3"}, {position: "D4"}]
    ]
  end

  def valid_coordinates
    base_grid.flatten.map { |square| square[:position] }
  end

  def valid_coordinate?(coord)
    valid_coordinates.include?(coord)
  end
end
