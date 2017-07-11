Rails.application.routes.draw do
  resources :forms
  resources :students
  namespace :api, defaults: { format: :json } do
    get '/form/', to: 'form#index'
    get '/form/:id', to: 'form#show'
    post '/form/', to: 'form#create'
    post '/session/', to: 'session#create'
    delete '/session/', to: 'session#destroy'
    get '/student/:id', to: 'student#show'
    post '/student/', to: 'student#create'
    get '/fee/', to: 'fee#index'
    post '/fee/', to: 'fee#create'
    delete '/fee/', to: 'fee#destroy'
  end
end
