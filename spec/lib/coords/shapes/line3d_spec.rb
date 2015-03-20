require 'spec_helper'

describe Coords::Shapes::Line3d do
  let(:point1) { Coords::Cartesian3d.new(1, 1, 1) }
  let(:point2) { Coords::Cartesian3d.new(1, 1, 2) }

  subject { Coords::Shapes::Line3d.new(1, 1, 1, 1, 1, 2) }

  describe '#point1' do
    it 'returns coordinates of point 1' do
      expect(subject.point1).to eq(point1)
    end
  end

  describe '#point2' do
    it 'returns coordinates of point 2' do
      expect(subject.point2).to eq(point2)
    end
  end

  describe '#ends' do
    it 'returns array of coordinates of points' do
      expect(subject.ends).to eq([point1, point2])
    end
  end

  describe '#length_squared' do
    it 'returns squared distance between both ends' do
      expect(subject.length_squared).to eq(1)
    end
  end

  describe '#length' do
    it 'returns distance between both ends' do
      expect(subject.length).to eq(1)
    end
  end

  describe '#to_s' do
    it 'returns comma delimited coordinate values' do
      expect(subject.to_s).to eq('(1,1,1),(1,1,2)')
    end
  end

  describe '#==' do
    it 'compares equality of two lines' do
      equal_line = Coords::Shapes::Line3d.new(1,1,1,1,1,2)
      unequal_line = Coords::Shapes::Line3d.new(1,1,1,2,2,2)
      expect(subject == equal_line).to be true
      expect(subject == unequal_line).to be false
    end
  end

  describe '#translate' do
    it 'translates line to a new line' do
      line2 = subject.translate(3, 4, 5)
      expect(subject.point1.x).to eq(1)
      expect(subject.point1.y).to eq(1)
      expect(subject.point1.z).to eq(1)
      expect(subject.point2.x).to eq(1)
      expect(subject.point2.y).to eq(1)
      expect(subject.point2.z).to eq(2)

      expect(line2.point1.x).to eq(4)
      expect(line2.point1.y).to eq(5)
      expect(line2.point1.z).to eq(6)
      expect(line2.point2.x).to eq(4)
      expect(line2.point2.y).to eq(5)
      expect(line2.point2.z).to eq(7)
    end
  end

end