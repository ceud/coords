module Coords
  module Shapes
    class Line2d

      def initialize(x1, y1, x2, y2)
        @point1 = Coords::Cartesian2d.new(x1, y1)
        @point2 = Coords::Cartesian2d.new(x2, y2)
      end

      def point1
        @point1
      end

      def point2
        @point2
      end

      def ends
        [point1, point2]
      end

      def length_squared
        point1.distance_squared(point2)
      end

      def length
        Math.sqrt(length_squared)
      end

      def to_s
        "(#{point1.x.to_s},#{point1.y.to_s}),(#{point2.x.to_s},#{point2.y.to_s})"
      end

      def ==(line)
        ((point1 == line.point1 && point2 == line.point2) || (point1 == line.point2 && point2 == line.point1))
      end

      def translate(x2, y2)
        translated_line = Line2d.new(point1.x, point1.y, point2.x, point2.y)
        translated_line.translate!(x2, y2)
        translated_line
      end

      def translate!(x2, y2)
        point1.translate!(x2, y2)
        point2.translate!(x2, y2)
      end

    end
  end
end