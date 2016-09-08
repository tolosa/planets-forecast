class ForecastCalculator

  Weather = Struct.new(:forecast, :precipitation)

  class << self

    def for_day(day)
      precipitation = 0
      forecast = :normal
      if Planet.all_aligned?(day)
        forecast = :optimal
        if Planet.all_aligned?(day, include_sun: true)
          forecast = :drought
        end
      else
        if Planet.sun_in_triangle?(day)
          precipitation = Planet.triangle_area(day)
          forecast = :rain
        end
      end
      return Weather.new(forecast, precipitation)
    end

  end
end
