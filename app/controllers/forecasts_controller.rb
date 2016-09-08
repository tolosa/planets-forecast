class ForecastsController < ApplicationController

  def show
    @forecast = Forecast.find_by(day: params[:id])
    render json: @forecast
  end

  def index
    @forecasts = Forecast.all
    render json: @forecasts
  end

  def statistics
    @counts = Forecast.days_count_by_forecast
    render json: @counts
  end

  def most_rainy
    @forecast = Forecast.most_rainy_day
    render json: @forecast
  end

end
