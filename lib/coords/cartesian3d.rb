module Coords
  class Cartesian3d < Cartesian2d
    def initialize(x, y, z)
      super(x, y)
      @z = z
    end

    def z
      @z
    end

    def distance_squared(point)
      ((x - point.x).abs ** 2) + ((y - point.y).abs ** 2) + ((z - point.z).abs ** 2)
    end

    def to_s
      x.to_s + ',' + y.to_s + ',' + z.to_s
    end

    def to_spherical
      radius = Math.sqrt((x ** 2) + (y ** 2) + (z ** 2));
      theta = Math.acos(z / radius)
      phi = Math.atan2(y, x)

      Spherical.new(radius, theta, phi)
    end
  end
end