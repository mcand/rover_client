#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__)))

class Rover
  attr_accessor :x, :y, :heading

  def initialize(x, y, heading)
    @x = x
    @y = y
    @heading = heading
  end
end
