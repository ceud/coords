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

      Cartesian2d.new(x.round(15), y.round(15))
    end

    def ==(point)
      radius.round(15) == point.radius.round(15) && theta.round(15) == point.theta.round(15)
    end

  end
end