Rails.application.routes.draw do
 
root "sessions#home"
#signup
get '/signup' => 'companies#new'
post '/signup' => 'companies#create'

#logout
delete '/logout' => 'sessions#destroy'

#scope_route
get 'rigs/deepest' => 'rigs#deepest'

#login
get '/login' => 'sessions#new'

post '/login' => 'sessions#create'

get '/auth/:provider/callback' => 'sessions#google'

resources :rigs do
  resources :reviews
end
resources :companies do
  resources :rigs, shallow: true
end
resources :reviews
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
