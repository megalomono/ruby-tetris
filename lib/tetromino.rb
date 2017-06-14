require 'gosu'

class Tetromino

  ORIENTATIONS = [:up, :right, :down, :left]

  attr_reader :position, :orientation
  
  def self.random(grid, position)
    shapes = [ T, LLeft, LRight, Line, Square, StepLeft, StepRight ]
    t = Time.now.to_f / (Time.now.to_f % Time.now.to_i)
    random_seed = t * 1103515245 + 12345;
    srand((random_seed / 65536) % 32768);
    shapes[rand(shapes.length)].new(grid, position)
  end
  
  def initialize(grid, position, orientation = :up)
    @grid = grid
    @position = position
    @orientation = orientation
    @fixed = false
  end
  
  def fixed?
    @fixed
  end
  
  def move_left
    next_position = @position.displace -1, 0
    if @grid.can_move_to? occupied_coordinates_for(next_position, @orientation)
      @position = next_position
    end
  end
  
  def move_right
    next_position = @position.displace 1, 0
    if @grid.can_move_to? occupied_coordinates_for(next_position, @orientation)
      @position = next_position
    end
  end

  def move_down
    next_position = @position.displace 0, 1
    if @grid.can_move_to? occupied_coordinates_for(next_position, @orientation)
      @position = next_position
    else
      @fixed = true
      @grid.add occupied_coordinates_for(@position, @orientation).map { |c| Block.new(c, @grid.block_size, @color) }
    end
  end
  
  def rotate
    next_orientation_index = (ORIENTATIONS.index(@orientation) + 1) % 4
    next_orientation = ORIENTATIONS[next_orientation_index]
    if @grid.can_move_to? occupied_coordinates_for(@position, next_orientation)
      @orientation = next_orientation
    end
  end
  
  def occupied_coordinates
    occupied_coordinates_for(@position, @orientation)
  end
  
  def render
    occupied_coordinates.each { |c| Block.new(c, @grid.block_size, @color).render }
  end
  
  private

    def occupied_coordinates_for(position, orientation)
      coordinates = []
      self.send(orientation).each_with_index do |row, y|
        row.each_with_index do |col, x|
          coordinates << position.displace(x, y) if col == 1
        end
      end
      coordinates
    end
end