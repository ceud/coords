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

end
