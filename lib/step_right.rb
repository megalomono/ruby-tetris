class StepRight < Tetromino

	def initialize(grid, position, orientation = :up)
		@color = Gosu::Color::GRAY
		super
	end
  
  def up
    [
      [0, 1, 1],
      [1, 1, 0]
    ]
  end

  def right
    [
      [1, 0],
      [1, 1],
      [0, 1]
    ]
  end

  alias :down :up
  
  alias :left :right
end