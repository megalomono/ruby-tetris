class StepLeft < Tetromino

  def initialize(position)
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