require 'spec_helper'

describe Coords::Cartesian2d do
  subject { Coords::Cartesian2d.new(1, 2) }

  # describe '#x' do
  #   it 'returns value of x coordinate' do
  #     expect(subject.x).to eq(1)
  #   end
  # end

  # describe '#y' do
  #   it 'returns value of y coordinate' do
  #     expect(subject.y).to eq(2)
  #   end
  # end

  describe '#distance_squared' do
    it 'returns squared distance between two points' do
      point2 = Coords::Cartesian2d.new(4, 6)
      expect(subject.distance_squared(point2)).to eq(25)
    end
  end

  describe '#distance' do
    it 'returns distance between two points' do
      point2 = Coords::Cartesian2d.new(4, 6)
      expect(subject.distance(point2)).to eq(5)
    end
  end

  describe '#to_s' do
    it 'returns comma delimited coordinate values' do
      expect(subject.to_s).to eq('1,2')
    end
  end

  describe '#to_polar' do
    it 'returns point in polar coordinate system' do
      polar = subject.to_polar
      expect(polar.radius).to eq(2.2360679775)
      expect(polar.theta).to eq(1.107148717794)
    end
  end

  describe '#==' do
    it 'compares coordinate values equality' do
      point2 = Coords::Cartesian2d.new(1, 2)
      expect(subject == point2).to be true
      expect(subject != point2).to be false
    end
  end

  describe '#translate' do
    it 'translates values to new point' do
      point2 = subject.translate(3, 4)
      expect(subject.x).to eq(1)
      expect(subject.y).to eq(2)
      expect(point2.x).to eq(4)
      expect(point2.y).to eq(6)
    end
  end

  describe '#rotate' do
    it 'rotates values to new point' do
      point2 = subject.rotate(Coords.radians(90))
      expect(subject.x).to eq(1)
      expect(subject.y).to eq(2)
      expect(point2.x).to eq(-2)
      expect(point2.y).to eq(1)
    end
  end

  describe '#reflect' do
    it 'reflects values to new point by origin' do
      point2 = subject.reflect('origin')
      expect(subject.x).to eq(1)
      expect(subject.y).to eq(2)
      expect(point2.x).to eq(-1)
      expect(point2.y).to eq(-2)
    end

    it 'reflects values to new point by line' do
      point2 = subject.reflect('line')
      expect(subject.x).to eq(1)
      expect(subject.y).to eq(2)
      expect(point2.x).to eq(2)
      expect(point2.y).to eq(1)
    end

    it 'reflects values to new point by x axis' do
      point2 = subject.reflect('x')
      expect(subject.x).to eq(1)
      expect(subject.y).to eq(2)
      expect(point2.x).to eq(1)
      expect(point2.y).to eq(-2)
    end

    it 'reflects values to new point by y axis' do
      point2 = subject.reflect('y')
      expect(subject.x).to eq(1)
      expect(subject.y).to eq(2)
      expect(point2.x).to eq(-1)
      expect(point2.y).to eq(2)
    end
  end
end