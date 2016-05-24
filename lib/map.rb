#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__)))

class Map
  attr_accessor :width, :height
  def initialize(width=10, height=10)
    @width = width
    @height = height
  end
end
