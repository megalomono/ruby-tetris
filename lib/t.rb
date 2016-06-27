class T < Tetromino

	def initialize(grid, position, orientation = :up)
		@color = Gosu::Color.new(0xff000000)
    @color.red = 255
    @color.green = 255
    @color.blue = 0
		super
	end
  
  def up
    [
      [1, 1, 1],
      [0, 1, 0]
    ]
  end

  def right
    [
      [0, 1],
      [1, 1],
      [0, 1]
    ]
  end

  def down
    [
      [0, 1, 0],
      [1, 1, 1]
    ]
  end
  
  def left
    [
      [1, 0],
      [1, 1],
      [1, 0]
    ]
  end
end