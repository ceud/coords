module Coords
  class Cartesian2d
    def initialize(x, y)
      @x = x
      @y = y
    end

    def x
      @x
    end

    def y
      @y
    end

    def distance_squared(point)
      ((x - point.x).abs ** 2) + ((y - point.y).abs ** 2)
    end

    def distance(point)
      Math.sqrt(distance_squared(point))
    end

    def to_s
      x.to_s + ',' + y.to_s
    end

    def to_polar
      radius = Math.sqrt((x ** 2) + (y ** 2));
      theta = Math.atan2(y, x);

      Polar.new(radius, theta)
    end
  end
end