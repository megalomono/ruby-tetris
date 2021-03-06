class T < Tetromino

	def initialize(grid, position, orientation = :up)
		@color = Gosu::Color::YELLOW
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