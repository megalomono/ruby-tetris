require 'rubygems'
require 'pathname'
require 'gosu'

# Include the current lib directory in the include path
$: << Pathname.new(File.dirname(__FILE__)).realpath

require 'lib/grid'
require 'lib/coordinate'
require 'lib/block'
require 'lib/tetromino'
require 'lib/square'
require 'lib/l_right'
require 'lib/l_left'
require 'lib/t'
require 'lib/line'
require 'lib/step_right'
require 'lib/step_left'

class Tetris < Gosu::Window
  
  def initialize
    super 10 * 25, 20 * 25, false
    @grid = Grid.new 10, 20, 25
    @item = LRight.new(@grid, Coordinate.new(0, 0))
    @elapsed_milliseconds = 0
    @fall_frequency = 5
  end

  def update
    @item = Square.new(@grid, Coordinate.new(0, 0)) if @item.fixed?
    if @elapsed_milliseconds % 3 == 0
      case @pressed_button
        when :left then @item.move_left
        when :right then @item.move_right
        when :down then @item.move_down
        when :up then @item.rotate
      end
      @pressed_button = nil
    end
    @item.move_down if @elapsed_milliseconds % @fall_frequency == 0
    @elapsed_milliseconds += 1
  end
  
  def draw
    @item.render
    @grid.render
  end
  
  def button_down(id)
    close if id == Gosu::KbEscape
    @pressed_button = :left if id == Gosu::KbLeft
    @pressed_button = :right if id == Gosu::KbRight
    @pressed_button = :down if id == Gosu::KbDown
    @pressed_button = :up if id == Gosu::KbUp
  end
end

Tetris.new.show