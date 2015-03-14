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

    def ==(point)
      x.round(15) == point.x.round(15) && y.round(15) == point.y.round(15) && z.round(15) == point.z.round(15)
    end

    def translate(x2, y2, z2)
      Cartesian3d.new(x + x2, y + y2, z + z2)
    end

    def translate!(x2, y2, z2)
      super(x2, y2)
      @z += z2
    end

    # def rotate(theta)
    #   x_rotated = (x * Math.cos(theta)) - (y * Math.sin(theta))
    #   y_rotated = (x * Math.sin(theta)) + (y * Math.cos(theta))

    #   Cartesian2d.new(x_rotated, y_rotated)
    # end

    # def rotate!(theta)
    #   @x = (x * Math.cos(theta)) - (y * Math.sin(theta))
    #   @y = (x * Math.sin(theta)) + (y * Math.cos(theta))
    # end

  end
end