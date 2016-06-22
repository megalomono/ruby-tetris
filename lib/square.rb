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

  def left
    up
  end
  
  def down
    up
  end
  
  def right
    up
  end
end