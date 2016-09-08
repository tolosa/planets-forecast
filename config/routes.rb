Rails.application.routes.draw do

  resources :forecasts, only: [:show] do
    collection do
      get :statistics
      get :most_rainy
    end
  end

end
