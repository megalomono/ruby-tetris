require 'rubygems'
require 'pathname'
require 'gosu'

# Include the current lib directory in the include path
$: << Pathname.new(File.dirname(__FILE__)).realpath

require 'lib/coordinate'
require 'lib/block'
require 'lib/tetromino'
require 'lib/square'
require 'lib/l_right'

class Tetris < Gosu::Window
  
  def initialize
    super 640, 480, false
    @item = LRight.new Coordinate.new(1, 1)
    @elapsed_milliseconds = 0
    @fall_frequency = 60
  end

  def update
    case @pressed_button
      when :left then @item.move_left
      when :right then @item.move_right
      when :down then @item.move_down
      when :up then @item.rotate
    end
    @pressed_button = nil
    #@item.move_down if @elapsed_milliseconds % @fall_frequency == 0
		@elapsed_milliseconds += 1
  end
  
  def draw
    @item.render
  end
  
  def button_down(id)
    close if id == Gosu::KbEscape
    @pressed_button = :left if id == Gosu::KbLeft
    @pressed_button = :right if id == Gosu::KbRight
    @pressed_button = :down if id == Gosu::KbDown
    @pressed_button = :up if id == Gosu::KbUp
  end
end

window = Tetris.new
window.show