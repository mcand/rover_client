require 'spec_helper'
require 'rover'

describe Rover do
  it "is possible to create a rover with coordinate x, y and heading" do
    rover = Rover.new(3, 4, 'N')

    expect(rover.x).to eq(3)
    expect(rover.y).to eq(4)
    expect(rover.heading).to eq('N')
  end
end
