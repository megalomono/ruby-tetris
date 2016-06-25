class Block

  def initialize(position, size)
    @block_image = Gosu::Image.new("media/block.png", { tileable: true })
    @position = position
    @size = size
  end
  
  def render
    @block_image.draw(@position.x * @size, @position.y * @size, 0)
  end
end