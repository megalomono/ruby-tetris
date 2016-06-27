class Grid

  WIDTH = 10
  HEIGHT = 20

  attr_accessor :block_size
  
  def initialize
    @block_size = 25
    @occupied_coordinates = empty_grid
    @blocks = []
  end
  
  def occupy_coordinate(coordinate)
    @occupied_coordinates[coordinate.y][coordinate.x] = 1
  end
  
  def occupy_coordinates(blocks)
    blocks.each { |b| occupy_coordinate b.position }
    @blocks += blocks
    dismiss_completed_lines
  end
  
  def can_move_to_coordinate(coordinate)
    return false unless coordinate.x.between?(0, WIDTH - 1)
    return false unless coordinate.y < HEIGHT
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
    
    def dismiss_completed_lines
      @occupied_coordinates.each_with_index do |row, y|  
        if row.all? { |x| x == 1 }
          @occupied_coordinates.delete_at y
          @occupied_coordinates.insert 0, [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
          @blocks.delete_if { |b| b.position.y == y }
          @blocks.each { |b| b.position = b.position.displace(0, 1) if b.position.y < y }
        end
      end
    end
end