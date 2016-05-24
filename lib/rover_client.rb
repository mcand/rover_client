#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__)))

require 'map'
require 'rover'

class RoverClient
  def self.run
    rovers = []

    welcome

    map = get_map

    begin
      rover = get_rover
      rovers << [rover, get_rover_instructions] if rover
    end until rover

    for current_rover in rovers
      rover = current_rover[0]
      instructions = current_rover[1]

      for instruction in instructions.split('')
        if instruction == 'M'
          rover.move
        elsif instruction == 'R'
          rover.rotate()
        elsif instruction == 'L'
          rover.rotate(true)
        end
      end if instructions

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
      map_params = gets.chomp

      map_dimentions = map_params.split.map!(&:to_i)

      Map.new(map_dimentions[0], map_dimentions[1])
    end

    def self.get_rover
      headings = ['N', 'S', 'E', 'W']
      rover_params = gets.upcase.chomp

      rover_locale = rover_params.split

      if rover_locale.length != 3
        puts "Couldn't read rover locale"
        return
      else
        x = rover_locale[0].to_i
        y = rover_locale[1].to_i
        heading = rover_locale[2]

        if headings.include?(heading)
          return Rover.new(x, y, heading)
        else
          puts "Direction is invalid"
          return
        end
      end
    end

    def self.get_rover_instructions
      allowed_movements = ['L', 'R', 'M']

      movements_string = gets.upcase.chomp

      puts "Move Strings #{movements_string}"

      movements = movements_string.split('')

      puts "Movements #{movements}"

      movements.each do |m|
        unless allowed_movements.include?(m)
          puts "It seems you have entered an invalid movement!"
          return
        end
      end

      movements_string
    end
end
