#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__)))

require 'map'
require 'rover'

class RoverClient
  def self.run
    rovers = []

    welcome

    map = get_map

    return unless map

    begin
      rover = get_rover
      rovers << [rover, get_rover_instructions] if rover
    end until rover

    for current_rover in rovers
      rover = current_rover[0]
      instructions = current_rover[1]

      for instruction in instructions.split('')
        if instruction == 'M' && rover.rover_in_map?(map.width.to_i, map.height.to_i) # Rover cannot move out of map (bounder acts like a wall)
          rover.move
        elsif instruction == 'R'
          rover.rotate()
        elsif instruction == 'L'
          rover.rotate(true)
        else
          return
        end
      end if instructions

      puts "Rover out of map bounds" unless rover.rover_in_map?(map.width.to_i, map.height.to_i)
      puts '%d %d %s' % rover.get_rover_position
    end
  end

  protected
    def self.welcome
      puts "Welcome to RoverClient v0.1 \n"
      puts "Instructions:\n"
      puts "1. Enter the map size (e.g. 10 10)\n"
      puts "2. Enter the rover position x, y and position (e.g. 1 2 N) in the first line. Possible values for positions are [N]orth, [S]outh, [E]ast and [W]est\n"
      puts "3. Enter the moviments for the rover (e.g. LMLMLMLMM). Possible values for a movement are [L]eft [R]ight and [M]ove.\n\n"
    end

    def self.get_map
      until (input = gets) && (input =~ /(\d+)\s+(\d+)/)
        return  nil if input.to_s.chomp.empty?
        puts 'Invalid map inputs'
      end
      Map.new($1.to_s, $2.to_s)
    end

    def self.get_rover
      until (input = gets) && (input =~ /(\d+)\s+(\d+)\s([NSWE])/i)
        return if input.to_s.chomp.empty?
        puts "Invalid rover input"
      end
      Rover.new($1.to_i, $2.to_i, $3.to_s.upcase)
    end

    def self.get_rover_instructions
      until (input = gets) && (input =~ /([RLM]+)/i)
        return nil if input.to_s.chomp.empty?
        puts "Invalid rover instruction"
      end
      return $1.to_s.upcase
    end
end
