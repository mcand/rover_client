#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__)))

class Rover
  attr_accessor :x, :y, :heading

  def initialize(x, y, heading)
    @x = x
    @y = y
    @heading = heading
  end

  def move
    if @heading == 'N'
      @y = @y + 1
    elsif @heading == 'S'
      @y = @y - 1
    elsif @heading == 'E'
      @x = @x - 1
    else
      @x = @x + 1
    end
  end

  def get_hover_position
    [@x, @y, @heading]
  end
end
