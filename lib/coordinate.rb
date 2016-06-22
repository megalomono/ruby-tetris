class Coordinate

  BLOCK_SIZE = 25
  
  attr_reader :x, :y
  
  def initialize(x, y)
    @x = x
    @y = y
  end
  
  def x_in_pixels
    @x * BLOCK_SIZE
  end
  
  def y_in_pixels
    @y * BLOCK_SIZE
  end
  
  def displace(x, y)
    Coordinate.new @x + x, @y + y
  end
end