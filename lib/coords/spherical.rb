module Coords
  class Spherical < Polar

    def initialize(radius, theta, phi)
      super(radius, theta)
      @phi = phi
    end

    def phi
      @phi
    end

    def distance_squared(point)
      x1 = radius * Math.sin(theta) * Math.cos(phi)
      x2 = point.radius * Math.sin(point.theta) * Math.cos(point.phi)
      y1 = radius * Math.sin(theta) * Math.sin(phi)
      y2 = point.radius * Math.sin(point.theta) * Math.sin(point.phi)
      z1 = radius * Math.cos(theta)
      z2 = point.radius * Math.cos(point.theta)

      ((x2 - x1).abs ** 2) + ((y2 - y1).abs ** 2) + ((z2 - z1).abs ** 2)
    end

    def to_s
      radius.to_s + ',' + theta.to_s + ',' + phi.to_s
    end

    def to_cartesian
      x = radius * Math.sin(theta) * Math.cos(phi)
      y = radius * Math.sin(theta) * Math.sin(phi)
      z = radius * Math.cos(theta)

      Cartesian3d.new(x, y, z)
    end

    def ==(point)
      radius.round(12) == point.radius.round(12) && theta.round(12) == point.theta.round(12) && phi.round(12) == point.phi.round(12)
    end

  end
end