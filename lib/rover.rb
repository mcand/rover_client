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
      @x = @x + 1
    else
      @x = @x - 1
    end
  end

  def get_rover_position
    [@x, @y, @heading]
  end

  def rotate(left = false)
    if left
      if @heading == 'N'
        @heading = 'W'
      elsif @heading == 'S'
        @heading = 'E'
      elsif @heading == 'E'
        @heading = 'N'
      else
        @heading = 'S'
      end
    else
      if @heading == 'N'
        @heading = 'E'
      elsif @heading == 'S'
        @heading = 'W'
      elsif @heading == 'E'
        @heading = 'S'
      else
        @heading = 'N'
      end
    end
  end
end
