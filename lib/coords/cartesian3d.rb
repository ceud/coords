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

      Spherical.new(radius.round(12), theta.round(12), phi.round(12))
    end

    def ==(point)
      x.round(12) == point.x.round(12) && y.round(12) == point.y.round(12) && z.round(12) == point.z.round(12)
    end

    def translate(x2, y2, z2)
      translated_point = Cartesian3d.new(x, y, z)
      translated_point.translate!(x2, y2, z2)
      translated_point
    end

    def translate!(x2, y2, z2)
      super(x2, y2)
      @z += z2
    end

    def rotate(rZ = 0, rX = 0, rY = 0)
      rotated_point = Cartesian3d.new(x, y, z)
      rotated_point.rotate!(rZ, rX, rY)
      rotated_point
    end

    def rotate!(rZ = 0, rX = 0, rY = 0)
      d = Math.hypot(y, x)
      theta = Math.atan2(y, x) + rZ
      @x = d * Math.cos(theta)
      @y = d * Math.sin(theta)

      d = Math.hypot(y, z)
      theta = Math.atan2(z, y) + rX
      @y = d * Math.cos(theta)
      @z = d * Math.sin(theta)

      d = Math.hypot(x, z)
      theta = Math.atan2(x, z) + rY
      @z = d * Math.cos(theta)
      @x = d * Math.sin(theta)

      @x = x.round(12)
      @y = y.round(12)
      @z = z.round(12)
    end

  end
end