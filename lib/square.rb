class Square < Tetromino

	def initialize(grid, position, orientation = :up)
		@color = Gosu::Color.new(0xff000000)
    @color.red = 255
    @color.green = 0
    @color.blue = 0
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