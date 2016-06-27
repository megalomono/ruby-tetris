require 'gosu'

class Block

  attr_accessor :position

  def initialize(position, size, color)
    @block_image = Gosu::Image.new("media/block.png", { tileable: true })
    @position = position
    @size = size
    @color = color
  end
  
  def render
    @block_image.draw(@position.x * @size, @position.y * @size, 0, 1, 1, @color)
  end
end