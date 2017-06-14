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
    @grid = Grid.new_empty_grid 10, 20
    @elapsed_milliseconds = 0
    @fall_frequency = 10
  end

  def update
    if @grid.complete?
      show_game_over_message
      restart if @pressed_button == :enter
      return
    end
    
    if @paused
      show_paused_game_message
      return
    end
    
    generate_tetromino if no_active_tetromino
    handle_player_input
    execute_machine_actions    
    reset_input_and_messages
  end
  
  def draw
    @item.render
    @grid.render
    @message.draw_rot(125, 250, 1, 0) unless @message.nil?
    @help.draw_rot(125, 275, 1, 0) unless @help.nil?
  end
  
  def button_down(id)
    close if id == Gosu::KbEscape
    @pressed_button = :enter if id == Gosu::KbEnter || id == Gosu::KbReturn
    @pressed_button = :left if id == Gosu::KbLeft
    @pressed_button = :right if id == Gosu::KbRight
    @pressed_button = :down if id == Gosu::KbDown
    @pressed_button = :up if id == Gosu::KbUp
    @paused = !@paused if id == Gosu::KbSpace
  end
  
  private
  
    def show_game_over_message
      @message = Gosu::Image.from_text("GAME OVER", 25)
      @help = Gosu::Image.from_text("Press enter to restart", 20)
    end
  
    def show_paused_game_message
      @message = Gosu::Image.from_text("Paused", 25)
      @help = Gosu::Image.from_text("Press space to resume", 20)
    end
  
    def no_active_tetromino
      @item.nil? || @item.fixed?
    end
  
    def generate_tetromino
      @item = Tetromino.random(@grid, Coordinate.new(4, 0))
    end
  
    def handle_player_input
      case @pressed_button
        when :left then @item.move_left
        when :right then @item.move_right
        when :down then @item.move_down
        when :up then @item.rotate
      end
    end
    
    def execute_machine_actions
      @item.move_down if @elapsed_milliseconds % @fall_frequency == 0
      @elapsed_milliseconds += 1
    end
  
    def reset_input_and_messages
      @message = nil
      @help = nil
      @pressed_button = nil
    end
  
    def restart
      @grid = Grid.new_empty_grid 10, 20
      generate_tetromino
      @elapsed_milliseconds = 0
    end
end

Tetris.new.show