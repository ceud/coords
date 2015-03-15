require 'spec_helper'

describe Coords::Cartesian3d do
  subject { Coords::Cartesian3d.new(1, 2, 3) }

  describe '#z' do
    it 'returns value of z coordinate' do
      expect(subject.z).to eq(3)
    end
  end

  describe '#distance_squared' do
    it 'returns squared distance between two points' do
      point2 = Coords::Cartesian3d.new(4, 6, 8)
      expect(subject.distance_squared(point2)).to eq(50)
    end
  end

  describe '#to_s' do
    it 'returns comma delimited coordinate values' do
      expect(subject.to_s).to eq('1,2,3')
    end
  end

  describe '#to_spherical' do
    it 'returns point in spherical coordinate system' do
      spherical = subject.to_spherical
      expect(spherical.radius).to eq(3.741657386774)
      expect(spherical.theta).to eq(0.640522312679)
      expect(spherical.phi).to eq(1.107148717794)
    end
  end

  describe '#==' do
    it 'compares coordinate values equality' do
      point2 = Coords::Cartesian3d.new(1, 2, 3)
      expect(subject == point2).to be true
      expect(subject != point2).to be false
    end
  end

  describe '#translate' do
    it 'translates values to new point' do
      point2 = subject.translate(3, 4, 5)
      expect(subject.x).to eq(1)
      expect(subject.y).to eq(2)
      expect(subject.z).to eq(3)
      expect(point2.x).to eq(4)
      expect(point2.y).to eq(6)
      expect(point2.z).to eq(8)
    end
  end

  describe '#rotate' do
    it 'rotates values to new point' do
      point2 = subject.rotate(Coords.radians(90), Coords.radians(90), Coords.radians(90))
      expect(subject.x).to eq(1)
      expect(subject.y).to eq(2)
      expect(subject.z).to eq(3)
      expect(point2.x).to eq(1)
      expect(point2.y).to eq(-3)
      expect(point2.z).to eq(2)
    end
  end
end