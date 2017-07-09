Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    get '/forms/', to: 'forms#index'
    post '/sessions/', to: 'sessions#create'
  end
end
