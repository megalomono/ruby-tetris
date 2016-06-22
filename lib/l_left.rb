class LLeft < Tetromino

  def initialize(position)
    super
  end

  def up
    [
      [0, 1],
      [0, 1],
      [1, 1]
    ]
  end

  def right
    [
      [1, 0, 0],
      [1, 1, 1]
    ]
  end

  def down
    [
      [1, 1],
      [1, 0],
      [1, 0]
    ]
  end
  
  def left
    [
      [1, 1, 1],
      [0, 0, 1]
    ]
  end
end