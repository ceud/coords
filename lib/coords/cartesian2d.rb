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

      Polar.new(radius.round(12), theta.round(12))
    end

    def ==(point)
      x.round(12) == point.x.round(12) && y.round(12) == point.y.round(12)
    end

    def translate(x2, y2)
      translated_point = Cartesian2d.new(x, y)
      translated_point.translate!(x2, y2)
      translated_point
    end

    def translate!(x2, y2)
      @x += x2
      @y += y2
    end

    def rotate(theta)
      rotated_point = Cartesian2d.new(x, y)
      rotated_point.rotate!(theta)
      rotated_point
    end

    def rotate!(theta)
      tmp_x = x
      @x = ((x * Math.cos(theta)) - (y * Math.sin(theta))).round(12)
      @y = ((tmp_x * Math.sin(theta)) + (y * Math.cos(theta))).round(12)
    end

    def reflect(type = 'origin')
      reflected_point = Cartesian2d.new(x, y)
      reflected_point.reflect!(type)
      reflected_point
    end

    def reflect!(type = 'origin')
      if type == 'line'
        tmp_x = x
        @x = y
        @y = tmp_x
      else
        @x = x * -1 if ['origin', 'y'].include?(type)
        @y = y * -1 if ['origin', 'x'].include?(type)
      end
    end

  end
end