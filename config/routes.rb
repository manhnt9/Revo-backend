Rails.application.routes.draw do
  resources :students
  namespace :api, defaults: { format: :json } do
    get '/form/', to: 'form#index'
    post '/session/', to: 'session#create'
    post '/student/', to: 'student#create'
  end
end
