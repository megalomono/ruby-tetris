class Grid

  attr_reader :width, :height, :block_size
  
  def initialize(width, height, block_size)
    @width = width
    @height = height
    @block_size = block_size
    @occupied_coordinates = []
    set_boundaries
  end
  
  def occupy_coordinate(coordinate)
    @occupied_coordinates << coordinate
  end
  
  def can_move_to(coordinates)
    return !@occupied_coordinates.include?(coordinates) if coordinates.is_a? Coordinate
    return (@occupied_coordinates & coordinates).empty? if coordinates.is_a? Array
    return false
  end
  
  private
  
    def set_boundaries
      @occupied_coordinates += (0..@height).map { |y| Coordinate.new -1, y }
      @occupied_coordinates += (0..@height).map { |y| Coordinate.new @width, y }
      @occupied_coordinates += (-1..@width).map { |x| Coordinate.new(x, @height) }
    end
  
end