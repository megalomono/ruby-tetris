class Tetromino

  ORIENTATIONS = [:up, :right, :down, :left]

  def initialize(position)
    @position = position
    @orientation = :up
  end
  
  def move_left
    @position = @position.displace -1, 0
  end
  
  def move_right
    @position = @position.displace 1, 0
  end

  def move_down
    @position = @position.displace 0, 1
  end
  
  def rotate
    next_orientation = (ORIENTATIONS.index(@orientation) + 1) % 4
    @orientation = ORIENTATIONS[next_orientation]
  end
  
  def render
    @blocks = []
    self.send(@orientation).each_with_index do |row, y|
      row.each_with_index do |col, x|
        position = @position.displace x, y
        @blocks << Block.new(position) if col == 1
      end
    end
    @blocks.each { |b| b.render }
  end
end