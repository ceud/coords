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
      expect(spherical.radius).to eq(3.7416573867739413)
      expect(spherical.theta).to eq(0.6405223126794245)
      expect(spherical.phi).to eq(1.1071487177940904)
    end
  end

  describe '#==' do
    it 'compares coordinate values equality' do
      point2 = Coords::Cartesian3d.new(1, 2, 3)
      expect(subject == point2).to be true
      expect(subject != point2).to be false
    end
  end
end