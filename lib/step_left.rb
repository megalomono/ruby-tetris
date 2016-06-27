class StepLeft < Tetromino

  def initialize(grid, position, orientation = :up)
    @color = Gosu::Color.new(0xff000000)
    @color.red = 0
    @color.green = 255
    @color.blue = 0
    super
  end

  def up
    [
      [1, 1, 0],
      [0, 1, 1]
    ]
  end

  def right
    [
      [0, 1],
      [1, 1],
      [1, 0]
    ]
  end

  alias :down :up
  
  alias :left :right
end