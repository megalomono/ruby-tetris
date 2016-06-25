require 'test/unit'
require_relative '../lib/coordinate'

class CoordinateTest < Test::Unit::TestCase
  
  def test_displace_0
    # Given
    coordinate = Coordinate.new(1, 1)
    # When
    displaced_coordinate = coordinate.displace 0, 0
    # Then
    assert_equal coordinate, displaced_coordinate 
  end
  
  def test_displace_positive_x
    # Given
    coordinate = Coordinate.new(1, 1)
    # When
    displaced_coordinate = coordinate.displace 1, 0
    # Then
    assert_equal Coordinate.new(2, 1), displaced_coordinate 
  end
  
  def test_displace_negative_x
    # Given
    coordinate = Coordinate.new(1, 1)
    # When
    displaced_coordinate = coordinate.displace -1, 0
    # Then
    assert_equal Coordinate.new(0, 1), displaced_coordinate 
  end
  
  def test_displace_positive_y
    # Given
    coordinate = Coordinate.new(1, 1)
    # When
    displaced_coordinate = coordinate.displace 0, 1
    # Then
    assert_equal Coordinate.new(1, 2), displaced_coordinate 
  end
  
  def test_displace_negative_y
    # Given
    coordinate = Coordinate.new(1, 1)
    # When
    displaced_coordinate = coordinate.displace 0, -1
    # Then
    assert_equal Coordinate.new(1, 0), displaced_coordinate 
  end
  
end