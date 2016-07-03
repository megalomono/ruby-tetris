require 'test/unit'
require_relative '../lib/grid'
require_relative '../lib/coordinate'
require_relative '../lib/tetromino'
require_relative '../lib/square'
require_relative '../lib/l_right'
require_relative '../lib/l_left'
require_relative '../lib/t'
require_relative '../lib/line'
require_relative '../lib/step_right'
require_relative '../lib/step_left'

class ShapesTest < Test::Unit::TestCase
  
  def setup
    @grid = Grid.new_empty_grid 10, 20
  end
  
  def test_square_occupied_coordinates
    # Given
    square = Square.new(@grid, Coordinate.new(0, 0))
    # When
    coordinates = square.occupied_coordinates
    # Then
    assert_equal 4, coordinates.length    
    assert_true coordinates.include? Coordinate.new(0, 0)
    assert_true coordinates.include? Coordinate.new(0, 1)
    assert_true coordinates.include? Coordinate.new(1, 0)
    assert_true coordinates.include? Coordinate.new(1, 1)
  end
  
  def test_right_l_occupied_coordinates
    # Given
    l = LRight.new(@grid, Coordinate.new(0, 0), :up)
    # When
    coordinates = l.occupied_coordinates
    # Then
    assert_equal 4, coordinates.length    
    assert_true coordinates.include? Coordinate.new(0, 0)
    assert_true coordinates.include? Coordinate.new(0, 1)
    assert_true coordinates.include? Coordinate.new(0, 2)
    assert_true coordinates.include? Coordinate.new(1, 2)
  end
  
  def test_left_l_occupied_coordinates
    # Given
    l = LLeft.new(@grid, Coordinate.new(0, 0), :up)
    # When
    coordinates = l.occupied_coordinates
    # Then
    assert_equal 4, coordinates.length
    assert_true coordinates.include? Coordinate.new(1, 0)
    assert_true coordinates.include? Coordinate.new(1, 1)
    assert_true coordinates.include? Coordinate.new(1, 2)
    assert_true coordinates.include? Coordinate.new(0, 2)
  end
  
  def test_step_left_occupied_coordinates
    # Given
    step_left = StepLeft.new(@grid, Coordinate.new(0, 0), :up)
    # When
    coordinates = step_left.occupied_coordinates
    # Then
    assert_equal 4, coordinates.length
    assert_true coordinates.include? Coordinate.new(0, 0)
    assert_true coordinates.include? Coordinate.new(1, 0)
    assert_true coordinates.include? Coordinate.new(1, 1)
    assert_true coordinates.include? Coordinate.new(2, 1)
  end
  
  def test_step_right_occupied_coordinates
    # Given
    step_right = StepRight.new(@grid, Coordinate.new(0, 0), :up)
    # When
    coordinates = step_right.occupied_coordinates
    # Then
    assert_equal 4, coordinates.length
    assert_true coordinates.include? Coordinate.new(0, 1)
    assert_true coordinates.include? Coordinate.new(1, 1)
    assert_true coordinates.include? Coordinate.new(1, 0)
    assert_true coordinates.include? Coordinate.new(2, 0)
  end
  
  def test_line_occupied_coordinates
    # Given
    line = Line.new(@grid, Coordinate.new(0, 0), :up)
    # When
    coordinates = line.occupied_coordinates
    # Then
    assert_equal 4, coordinates.length
    assert_true coordinates.include? Coordinate.new(0, 0)
    assert_true coordinates.include? Coordinate.new(0, 1)
    assert_true coordinates.include? Coordinate.new(0, 2)
    assert_true coordinates.include? Coordinate.new(0, 3)
  end
  
  def test_t_occupied_coordinates
    # Given
    t = T.new(@grid, Coordinate.new(0, 0), :up)
    # When
    coordinates = t.occupied_coordinates
    # Then
    assert_equal 4, coordinates.length
    assert_true coordinates.include? Coordinate.new(0, 0)
    assert_true coordinates.include? Coordinate.new(1, 0)
    assert_true coordinates.include? Coordinate.new(1, 1)
    assert_true coordinates.include? Coordinate.new(2, 0)
  end
end