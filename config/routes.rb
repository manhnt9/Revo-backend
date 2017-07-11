Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    get '/form/', to: 'form#index'
    get '/form/:id', to: 'form#show'
    post '/form/', to: 'form#create'
    post '/session/', to: 'session#create'
    delete '/session/', to: 'session#destroy'
    get '/student/:id', to: 'student#show'
    post '/student/', to: 'student#create'
    get '/fee/', to: 'fee#index'
    patch '/fee/', to: 'fee#update'
    get '/presence/', to: 'presence#index'
    patch '/presence/', to: 'presence#update'
  end
end
