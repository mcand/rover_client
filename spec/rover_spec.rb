require 'spec_helper'
require 'rover'

describe Rover do
  HEADINGS = ['N', 'S', 'E', 'W'].freeze

  it "is possible to create a rover with coordinate x, y and heading" do
    rover = Rover.new(3, 4, 'N')

    expect(rover.x).to eq(3)
    expect(rover.y).to eq(4)
    expect(Rover::HEADINGS[rover.heading]).to eq('N')
  end

  describe "Rover is able to move to positions" do
    it "can move to North" do
      rover = Rover.new(4, 2, 'N')
      rover.move
      expect(rover.get_rover_position).to eq([4, 3, 'N'])
    end

    it "can move to South" do
      rover = Rover.new(4, 2, 'S')
      rover.move
      expect(rover.get_rover_position).to eq([4, 1, 'S'])
    end

    it "can move to East" do
      rover = Rover.new(4, 2, 'E')
      rover.move
      expect(rover.get_rover_position).to eq([5, 2, 'E' ])
    end

    it "can move to West" do
      rover = Rover.new(4, 2, 'W')
      rover.move
      expect(rover.get_rover_position).to eq([3, 2, 'W'])
    end
  end

  describe "Rover is able to rotate" do
    it "can rotate to right" do
      rover = Rover.new(4, 2, 'N')
      rover.rotate(false)
      expect(rover.get_rover_position).to eq([4, 2, 'E'])
    end

    it "can rotate to left" do
      rover = Rover.new(4, 2, 'S')
      rover.rotate(true)
      expect(rover.get_rover_position).to eq([4, 2, 'E'])
    end
  end

  describe "Rover cannot be outside the map" do
    it "is out of map" do
      rover = Rover.new(4, 2, 'N')
      expect(rover.rover_in_map?(2, 2)).to eq(false);
    end

    it "is in the map" do
      rover = Rover.new(4, 2, 'N')
      expect(rover.rover_in_map?(5, 5)).to eq(true);      
    end
  end
end
