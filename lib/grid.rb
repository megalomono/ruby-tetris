class Grid

  attr_accessor :block_size
  attr_reader :width, :height, :positions
  
  def self.new_empty_grid(width, height)
    Grid.new empty_grid(width, height)
  end
  
  def initialize(initial_grid)
    @width = initial_grid[0].size
    @height = initial_grid.size
    @block_size = 25
    @positions = initial_grid
    @blocks = []
  end
   
  def can_move_to?(coordinates)
    return coordinates.all? { |c| can_move_to_position? c }
  end
  
  def add(blocks)
    blocks.each { |b| occupy_position b.position }
    @blocks += blocks
    discard_completed_lines
  end
  
  def complete?
    @positions[0].any? { |x| x == 1 }
  end
  
  def render
    @blocks.each { |b| b.render }
  end
  
  private
  
    def self.empty_grid(width, height)
      return (0..height - 1).map { (0..width - 1).map { 0 }.to_a }.to_a
    end
    
    def can_move_to_position?(coordinate)
      return false unless coordinate.x.between?(0, @width - 1)
      return false unless coordinate.y < @height
      return @positions[coordinate.y][coordinate.x] == 0
    end
    
    def occupy_position(coordinate)
      @positions[coordinate.y][coordinate.x] = 1
    end
    
    def discard_completed_lines
      @positions.each_with_index do |row, y|  
        if row.all? { |x| x == 1 }
          @positions.delete_at y
          @positions.insert 0, [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
          @blocks.delete_if { |b| b.position.y == y }
          @blocks.each { |b| b.position = b.position.displace(0, 1) if b.position.y < y }
        end
      end
    end
end