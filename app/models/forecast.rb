class Forecast < ApplicationRecord

  scope :days_count_by_forecast, -> { unscoped.group(:forecast).count }
  scope :most_rainy_day, -> { all.max_by(&:precipitation) }

  default_scope { order(:day) }

  def as_json(options)
    super only: %i[day forecast precipitation]
  end

  class << self

    def generate_series!(days)
      self.transaction do
        self.delete_all
        days.times do |day|
          weather = ForecastCalculator.for_day(day)
          Forecast.create!(day: day, forecast: weather.forecast.to_s, precipitation: weather.precipitation)
        end
      end
      return days
    end

  end

end
