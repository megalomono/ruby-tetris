class Grid

  attr_reader :width, :height, :block_size
  
  def initialize(width, height, block_size)
    @width = width
    @height = height
    @block_size = block_size
    @occupied_coordinates = empty_grid
    @blocks = []
  end
  
  def occupy_coordinate(coordinate)
    @occupied_coordinates[coordinate.y][coordinate.x] = 1
  end
  
  def occupy_coordinates(blocks)
    blocks.each { |b| occupy_coordinate b.position }
    @blocks += blocks
  end
  
  def can_move_to_coordinate(coordinate)
    return false unless coordinate.x.between?(0, @width - 1)
    return false unless coordinate.y < @height
    return @occupied_coordinates[coordinate.y][coordinate.x] == 0
  end
  
  def can_move_to_coordinates(coordinates)
    return coordinates.all? { |c| can_move_to_coordinate c }
  end
  
  def render
    @blocks.each { |b| b.render }
  end
  
  private
  
    def empty_grid
      [
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
      ]
    end
end