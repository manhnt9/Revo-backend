Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    get '/forms/', to: 'forms#index'
  end
end
