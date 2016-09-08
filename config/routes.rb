Rails.application.routes.draw do

  resources :forecasts, only: [:show, :index] do
    collection do
      get :statistics
      get :most_rainy
    end
  end

end
