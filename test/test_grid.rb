require 'test/unit'
require_relative '../lib/grid'
require_relative '../lib/coordinate'

class GridTest < Test::Unit::TestCase
  
  def setup
    @grid = Grid.new 10, 20, 25
  end
  
  def test_can_move_to_one_coordinate
    # Given
    @grid.occupy_coordinate Coordinate.new(0, 0)
    # Then
    assert_false @grid.can_move_to_coordinate Coordinate.new(0, 0)
  end
  
  def test_can_move_to_multiple_coordinates
    # Given
    @grid.occupy_coordinate Coordinate.new(0, 0)
    # Then
    assert_false @grid.can_move_to_coordinates [Coordinate.new(0, 0), Coordinate.new(0, 1), Coordinate.new(1, 0)]
  end

  def test_can_move_outside_left_boundary
    # Given
    @grid = Grid.new 10, 20, 25
    # Then
    assert_false @grid.can_move_to_coordinates [Coordinate.new(-1, 0), Coordinate.new(-1, 1), Coordinate.new(0, 0)]
  end
  
  def test_can_move_outside_right_boundary
    # Then
    assert_false @grid.can_move_to_coordinates [Coordinate.new(10, 0), Coordinate.new(10, 1), Coordinate.new(11, 0)]
  end
      
  def test_can_move_outside_bottom_boundary
    # Then
    assert_false @grid.can_move_to_coordinates [Coordinate.new(5, 20), Coordinate.new(5, 19), Coordinate.new(6, 19)]
  end
  
end