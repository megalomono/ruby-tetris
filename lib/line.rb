class Line < Tetromino

  def initialize(position)
    super
  end

  def up
    [
      [1],
      [1],
      [1],
      [1]
    ]
  end

  def right
    [
      [1, 1, 1, 1]
    ]
  end

  alias :down :up
  
  alias :left :right
end