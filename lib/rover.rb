#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__)))

class Rover
  HEADINGS = ['N', 'E', 'S', 'W'].freeze

  attr_accessor :x, :y, :heading

  def initialize(x, y, heading)
    @x = x
    @y = y
    @heading = HEADINGS.find_index(heading)
  end

  def move
    case @heading
      when 0 then @y += 1
      when 1 then @x += 1
      when 2 then @y -= 1
      when 3 then @x -= 1
    end
  end

  def get_rover_position
    [@x, @y, Rover::HEADINGS[@heading]]
  end

  def rotate(left = false)
    if left
      @heading == 0 ? @heading = 3 : @heading -= 1
    else
      @heding == 3 ? @heading = 0 : @heading += 1
    end
  end

  def rover_in_map?(width, height)
    @x.between?(0, width) && @y.between?(0, height)
  end
end
