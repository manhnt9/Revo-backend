Rails.application.routes.draw do
  resources :forms
  resources :students
  namespace :api, defaults: { format: :json } do
    get '/form/', to: 'form#index'
    post '/form/', to: 'form#create'
    post '/session/', to: 'session#create'
    delete '/session/', to: 'session#destroy'
    post '/student/', to: 'student#create'
  end
end
