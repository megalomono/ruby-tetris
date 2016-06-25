class Tetromino

  ORIENTATIONS = [:up, :right, :down, :left]

  attr_reader :position
  attr_reader :orientation
  
  def initialize(grid, position, orientation = :up)
    @grid = grid
    @position = position
    @orientation = orientation
  end
  
  def move_left
    displace -1, 0
  end
  
  def move_right
    displace 1, 0
  end

  def move_down
    displace 0, 1
  end
  
  def rotate
    next_orientation_index = (ORIENTATIONS.index(@orientation) + 1) % 4
    next_orientation = ORIENTATIONS[next_orientation_index]
    @orientation = next_orientation if @grid.can_move_to occupied_coordinates(@position, next_orientation)
  end
  
  def occupied_coordinates(position = @position, orientation = @orientation)
    @coordinates = []
    self.send(orientation).each_with_index do |row, y|
      row.each_with_index do |col, x|
        @coordinates << position.displace(x, y) if col == 1
      end
    end
    @coordinates
  end
  
  def render
    occupied_coordinates.each { |c| Block.new(c, @grid.block_size).render }
  end
  
  private
  
    def displace(x_offset, y_offset)
      next_position = @position.displace x_offset, y_offset
      if @grid.can_move_to occupied_coordinates(next_position)
        @position = next_position
      else
        @grid.occupy_coordinate occupied_coordinates
      end
    end
end