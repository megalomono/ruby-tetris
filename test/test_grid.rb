require 'test/unit'
require_relative '../lib/grid'
require_relative '../lib/coordinate'

class GridTest < Test::Unit::TestCase
  
  def setup
    @grid = Grid.new_empty_grid 10, 20
  end
  
  def test_can_move_to_multiple_coordinates
    # Given
    grid = Grid.new [[1, 1, 1, 1, 1, 1, 1, 1, 1, 1]]
    # Then
    assert_false grid.can_move_to? [Coordinate.new(0, 0), Coordinate.new(0, 1), Coordinate.new(1, 0)]
  end

  def test_can_move_outside_left_boundary
    # Then
    assert_false @grid.can_move_to? [Coordinate.new(-1, 0), Coordinate.new(-1, 1), Coordinate.new(0, 0)]
  end
  
  def test_can_move_outside_right_boundary
    # Then
    assert_false @grid.can_move_to? [Coordinate.new(10, 0), Coordinate.new(10, 1), Coordinate.new(11, 0)]
  end
      
  def test_can_move_outside_bottom_boundary
    # Then
    assert_false @grid.can_move_to? [Coordinate.new(5, 20), Coordinate.new(5, 19), Coordinate.new(6, 19)]
  end
  
  def test_discard_completed_lines
    # Given
    grid = Grid.new [[1, 1, 1, 1, 0, 1, 1, 1, 1, 1]]
    coordinates_to_test = (0..9).map { |x| Coordinate.new(x, 0) }.to_a
    assert_false grid.can_move_to? coordinates_to_test
    block = Block.new(Coordinate.new(4, 0), grid.block_size, nil)
    # When
    grid.add [block]
    # Then
    assert_true grid.can_move_to? coordinates_to_test
  end
  
  def test_grid_not_complete
    # Given
    grid = Grid.new [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 1, 1, 1, 1, 0, 0, 0]]
    # Then
    assert_false grid.complete?
  end
  
  def test_grid_complete
    # Given
    grid = Grid.new [[0, 0, 0, 1, 0, 0, 0, 0, 0, 0], [0, 0, 0, 1, 1, 1, 0, 0, 0, 0]]
    # Then
    assert_true grid.complete?
  end
  
end