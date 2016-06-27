require 'test/unit'
require_relative '../lib/grid'
require_relative '../lib/coordinate'
require_relative '../lib/block'
require_relative '../lib/tetromino'
require_relative '../lib/square'
require_relative '../lib/l_right'

class TetrominoTest < Test::Unit::TestCase
  
  def setup
    @grid = Grid.new 10, 20, 25
  end
  
  def test_move_right
    # Given
    tetromino = Square.new(@grid, Coordinate.new(1, 1))
    # When
    tetromino.move_right
    # Then
    assert_equal Coordinate.new(2, 1), tetromino.position    
  end

  def test_move_left
    # Given
    tetromino = Square.new(@grid, Coordinate.new(1, 1))
    # When
    tetromino.move_left
    # Then
    assert_equal Coordinate.new(0, 1), tetromino.position    
  end
  
  def test_move_down
    # Given
    tetromino = Square.new(@grid, Coordinate.new(1, 1))
    # When
    tetromino.move_down
    # Then
    assert_equal Coordinate.new(1, 2), tetromino.position    
  end
  
  def test_rotate
    # Given
    tetromino = LRight.new(@grid, Coordinate.new(7, 0))
    # When
    tetromino.rotate
    # Then
    assert_equal :right, tetromino.orientation    
  end
  
  def test_rotate_outside_boundaries
    # Given
    tetromino = LRight.new(@grid, Coordinate.new(9, 0))
    # When
    tetromino.rotate
    # Then
    assert_equal :up, tetromino.orientation    
  end
  
  def test_tetromino_fixed
    # Given
    tetromino = LRight.new(@grid, Coordinate.new(0, 17))
    assert_true @grid.can_move_to_coordinates tetromino.occupied_coordinates
    # When
    tetromino.move_down
    # Then
    assert_true tetromino.fixed?
    assert_false @grid.can_move_to_coordinates tetromino.occupied_coordinates
  end
  
end