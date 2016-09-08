namespace :forecasts do

  DAYS_TO_GENERATE = 10 * 365

  desc 'Generate forecasts series'
  task generate: :environment do
    days = Forecast.generate_series!(DAYS_TO_GENERATE)
    puts "Successfully generated forecasts for #{days} days."
  end

end
