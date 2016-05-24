require 'spec_helper'
require 'map'

describe Map do
  it "is possible to create a map with dimentions" do
    map = Map.new(10, 5)

    expect(map.width).to eq(10)
    expect(map.height).to eq(5)
  end
end
