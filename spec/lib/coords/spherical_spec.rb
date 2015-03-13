require 'spec_helper'

describe Coords::Spherical do
  subject { Coords::Spherical.new(1, 2, 3) }

  describe '#phi' do
    it 'returns value of phi' do
      expect(subject.phi).to eq(3)
    end
  end

  describe '#distance_squared' do
    it 'returns squared distance between two points' do
      point2 = Coords::Spherical.new(4, 6, 8)
      expect(subject.distance_squared(point2)).to eq(20.773139100421478)
    end
  end

  describe '#to_s' do
    it 'returns comma delimited radius/theta/phi values' do
      expect(subject.to_s).to eq('1,2,3')
    end
  end

  describe '#to_cartesian' do
    it 'returns point in cartesian coordinate system' do
      cart = subject.to_cartesian
      expect(cart.x).to eq(-0.9001976297355174)
      expect(cart.y).to eq(0.12832006020245673)
      expect(cart.z).to eq(-0.4161468365471424)
    end
  end

  describe '#==' do
    it 'compares coordinate values equality' do
      point2 = Coords::Spherical.new(1, 2, 3)
      expect(subject == point2).to be true
      expect(subject != point2).to be false
    end
  end
end