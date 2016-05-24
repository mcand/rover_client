require 'spec_helper'
require 'rover'

describe Rover do
  it "is possible to create a rover with coordinate x, y and heading" do
    rover = Rover.new(3, 4, 'N')

    expect(rover.x).to eq(3)
    expect(rover.y).to eq(4)
    expect(rover.heading).to eq('N')
  end

  describe "Rover is able to move to positions" do
    it "can move to North" do
      rover = Rover.new(4, 2, 'N')
      rover.move
      expect(rover.get_hover_position).to eq([4, 3, 'N'])
    end

    it "can move to South" do
      rover = Rover.new(4, 2, 'S')
      rover.move
      expect(rover.get_hover_position).to eq([4, 1, 'S'])
    end

    it "can move to East" do
      rover = Rover.new(4, 2, 'E')
      rover.move
      expect(rover.get_hover_position).to eq([3, 2, 'E' ])
    end

    it "can move to West" do
      rover = Rover.new(4, 2, 'W')
      rover.move
      expect(rover.get_hover_position).to eq([5, 2, 'W'])
    end
  end


end
