# README

Imaginary planets forecast application, a developer evaluation for MercadoLibre.

## Endpoints

The API is currently hosted in Heroku, at the base address of `https://planets-forecast.herokuapp.com`. All listed actions are standard, unauthenticated GET methods on a JSON API.

### `/forecasts`

Gets a list of all calculated forecasts.

### `/forecasts/[day]`

Gets forecast for a specific day number.

### `/forecasts/statistics`

Gets a count of days for each forecast condition.

### `/forecasts/most_rainy`

Gets the forecast for the day with more precipitation.
