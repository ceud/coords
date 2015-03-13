require 'spec_helper'

describe Coords::Polar do
  subject { Coords::Polar.new(1, 2) }

  describe '#radius' do
    it 'returns value of radius' do
      expect(subject.radius).to eq(1)
    end
  end

  describe '#theta' do
    it 'returns value of theta' do
      expect(subject.theta).to eq(2)
    end
  end

  describe '#distance_squared' do
    it 'returns squared distance between two points' do
      point2 = Coords::Polar.new(4, 6)
      expect(subject.distance_squared(point2)).to eq(22.229148966908895)
    end
  end

  describe '#distance' do
    it 'returns distance between two points' do
      point2 = Coords::Polar.new(4, 6)
      expect(subject.distance(point2)).to eq(4.714779842888626)
    end
  end

  describe '#to_s' do
    it 'returns comma delimited radius/theta values' do
      expect(subject.to_s).to eq('1,2')
    end
  end

  describe '#to_cartesian' do
    it 'returns point in cartesian coordinate system' do
      cart = subject.to_cartesian
      expect(cart.x).to eq(-0.4161468365471424)
      expect(cart.y).to eq(0.9092974268256817)
    end
  end

  describe '#==' do
    it 'compares coordinate values equality' do
      point2 = Coords::Polar.new(1, 2)
      expect(subject == point2).to be true
      expect(subject != point2).to be false
    end
  end
end