class Coordinate

  attr_reader :x, :y
  
  def initialize(x, y)
    @x = x
    @y = y
  end
  
  def displace(x_offset, y_offset)
    Coordinate.new @x + x_offset, @y + y_offset
  end
  
  def ==(another_coordinate)
    @x == another_coordinate.x && @y == another_coordinate.y
  end
  
  def eql?(another_coordinate)
    self == another_coordinate
  end
  
  def hash
    [@x, @y].hash
  end
  
  def to_s
    "[#{@x},#{@y}]"
  end
end