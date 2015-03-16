module Coords
  class Polar

    def initialize(radius, theta)
      @radius = radius
      @theta = theta
    end

    def radius
      @radius
    end

    def theta
      @theta
    end

    def distance_squared(point)
      x1 = radius * Math.cos(theta)
      x2 = point.radius * Math.cos(point.theta)
      y1 = radius * Math.sin(theta)
      y2 = point.radius * Math.sin(point.theta)

      ((x2 - x1).abs ** 2) + ((y2 - y1).abs ** 2)
    end

    def distance(point)
      Math.sqrt(distance_squared(point))
    end

    def to_s
      radius.to_s + ',' + theta.to_s
    end

    def to_cartesian
      x = radius * Math.cos(theta)
      y = radius * Math.sin(theta)

      Cartesian2d.new(x.round(12), y.round(12))
    end

    def ==(point)
      radius.round(12) == point.radius.round(12) && theta.round(12) == point.theta.round(12)
    end

    def translate(radius2, theta2)
      translated_point = Polar.new(radius, theta)
      translated_point.translate!(radius2, theta2)
      translated_point
    end

    def translate!(radius2, theta2)
      c1 = self.to_cartesian
      c2 = Polar.new(radius2, theta2).to_cartesian
      c3 = c1.translate(c2.x, c2.y)
      p = c3.to_polar

      @radius = p.radius
      @theta = p.theta
    end

    def rotate(radians)
      rotated_point = Polar.new(radius, theta)
      rotated_point.rotate!(radians)
      rotated_point
    end

    def rotate!(radians)
      @theta += radians
      @theta -= (2 * Math::PI) while theta > (2 * Math::PI)
      @theta += (2 * Math::PI) while theta < 0
    end

  end
end