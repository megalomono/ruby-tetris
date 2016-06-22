class Square < Tetromino

  def initialize(position)
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