module Coords
  module Shapes
    class Line3d < Line2d

      def initialize(x1, y1, z1, x2, y2, z2)
        @point1 = Coords::Cartesian3d.new(x1, y1, z1)
        @point2 = Coords::Cartesian3d.new(x2, y2, z2)
      end

      def to_s
        "(#{point1.x.to_s},#{point1.y.to_s},#{point1.z.to_s}),(#{point2.x.to_s},#{point2.y.to_s},#{point2.z.to_s})"
      end

      def translate(x2, y2, z2)
        translated_line = Line3d.new(point1.x, point1.y, point1.z, point2.x, point2.y, point2.z)
        translated_line.translate!(x2, y2, z2)
        translated_line
      end

      def translate!(x2, y2, z2)
        point1.translate!(x2, y2, z2)
        point2.translate!(x2, y2, z2)
      end

    end
  end
end