require 'spec_helper'

describe Coords do

  describe '#radians' do
    it 'converts degrees to radians' do
      expect(Coords.radians(180)).to eq(Math::PI)
    end
  end

  describe '#degrees' do
    it 'converts radians to degrees' do
      expect(Coords.degrees(Math::PI)).to eq(180)
    end
  end

  describe '#rotate_matrix' do
    it 'rotates matrix 90 degrees clockwise' do
      matrix1 = [[1, 2], [3, 4]]
      matrix2 = [[3, 1], [4, 2]]
      expect(Coords.rotate_matrix(matrix1)).to eq(matrix2)
    end

    it 'rotates matrix 90 degrees counter-clockwise' do
      matrix1 = [[1, 2], [3, 4]]
      matrix2 = [[2, 4], [1, 3]]
      expect(Coords.rotate_matrix(matrix1, 1, false)).to eq(matrix2)
    end

    it 'rotates matrix 180 degrees clockwise' do
      matrix1 = [[1, 2], [3, 4]]
      matrix2 = [[4, 3], [2, 1]]
      expect(Coords.rotate_matrix(matrix1, 2)).to eq(matrix2)
    end
  end

end