class Block

  attr_writer :position

  def initialize(position)
    @block_image = Gosu::Image.new("media/block.png", { tileable: true })
    @position = position
  end
  
  def render
    @block_image.draw(@position.x_in_pixels, @position.y_in_pixels, 0)
  end
end