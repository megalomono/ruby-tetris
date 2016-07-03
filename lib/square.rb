class Square < Tetromino

	def initialize(grid, position, orientation = :up)
		@color = Gosu::Color::RED 
		super
	end
  
  def up
    [
      [1, 1],
      [1, 1]
    ]
  end

  alias :left :up
  alias :down :up
  alias :right :up
end