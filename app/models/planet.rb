class Planet < ApplicationRecord

  attr_readonly :name, :distance_to_sun, :angular_velocity

  DISTANCE_TOLERANCE = 100
  SUN_COORDINATES = Geometry::Point.new(0, 0)

  def angular_velocity_radians
    (angular_velocity / 180.to_f) * Math::PI
  end

  def position(day)
    x = Math.cos(angular_velocity_radians * day) * distance_to_sun
    y = Math.sin(angular_velocity_radians * day) * distance_to_sun
    return Geometry::Point.new(x, y)
  end

  class << self

    def all_aligned?(day, include_sun: false)
      points = planets_points(day)
      points << SUN_COORDINATES if include_sun
      points.sort_by { |p| [p.x, p.y] }
      line = Geometry::Line.new(points.first, points.last)
      aligns = true
      points.slice(1..-2).each do |point|
        if line.distance_to(point) > DISTANCE_TOLERANCE
          aligns = false
          break
        end
      end
      return aligns
    end

    def sun_in_triangle?(day)
      planets_polygon(day).contains? SUN_COORDINATES
    end

    def triangle_area(day)
      planets_polygon(day).area
    end

  private

    def planets_points(day)
      Planet.all.map { |p| p.position(day) }
    end

    def planets_polygon(day)
      Geometry::Polygon.new planets_points(day)
    end

  end

end
