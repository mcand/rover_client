#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__)))

require 'map'
require 'rover'

class RoverClient
  def self.run
    rovers = []

    welcome

    map = get_map

    puts "Coordenadas #{map.width} #{map.height}"
  end

  protected
    def self.get_map
      map_params = gets.chomp

      map_dimentions = map_params.split.map!(&:to_i)

      Map.new(map_dimentions[0], map_dimentions[1])
    end

    def self.welcome
      puts "Welcome to RoverClient\n"
      puts "Instructions:\n"
      puts "1. Enter the map size (e.g. 10 10)\n"
      puts "2. Enter the rover position x, y and position (e.g. 1 2 N) in the first line. Possible values for positions are [N]orth, [S]outh, [E]ast and [W]est\n"
      puts "3. Enter the moviments for the rover (e.g. LMLMLMLMM). Possible values for a movement are [L]eft [R]ight and [Move].\n\n"
    end
end
