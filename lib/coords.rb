require "coords/version"
require "coords/cartesian2d"
require "coords/cartesian3d"
require "coords/polar"
require "coords/spherical"

module Coords

  def self.radians(degrees)
    degrees * (Math::PI / 180)
  end

  def self.degrees(radians)
    radians / (Math::PI / 180)
  end

  def self.rotate_matrix(matrix, times = 1, clockwise = true)
    new_matrix = matrix
    times.times.each do |i|
      new_matrix = clockwise ? new_matrix.reverse.transpose : new_matrix.transpose.reverse
    end
    new_matrix
  end

end
