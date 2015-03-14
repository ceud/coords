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

    def ==(point)
      x.round(15) == point.x.round(15) && y.round(15) == point.y.round(15)
    end

    def translate(x2, y2)
      Cartesian2d.new(x + x2, y + y2)
    end

    def translate!(x2, y2)
      @x += x2
      @y += y2
    end

    def rotate(theta)
      x_rotated = ((x * Math.cos(theta)) - (y * Math.sin(theta))).round(15)
      y_rotated = ((x * Math.sin(theta)) + (y * Math.cos(theta))).round(15)

      Cartesian2d.new(x_rotated, y_rotated)
    end

    def rotate!(theta)
      @x = ((x * Math.cos(theta)) - (y * Math.sin(theta))).round(15)
      @y = ((x * Math.sin(theta)) + (y * Math.cos(theta))).round(15)
    end

  end
end