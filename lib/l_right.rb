class LRight < Tetromino

	def initialize(grid, position, orientation = :up)
		@color = Gosu::Color.new(0xff000000)
    @color.red = 180
    @color.green = 0
    @color.blue = 255
		super
	end
  
  def up
    [
      [1, 0],
      [1, 0],
      [1, 1]
    ]
  end

  def right
    [
      [1, 1, 1],
      [1, 0, 0]
    ]
  end

  def down
    [
      [1, 1],
      [0, 1],
      [0, 1]
    ]
  end
  
  def left
    [
      [0, 0, 1],
      [1, 1, 1]
    ]
  end
end