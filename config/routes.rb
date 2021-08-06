Rails.application.routes.draw do
  resources :rigs
  resources :reviews
root "sessions#home"
#signup
get '/signup' => 'companies#new'
post '/signup' => 'companies#create'

#logout
delete '/logout' => 'sessions#destroy'

#login
get '/login' => 'sessions#new'

post '/login' => 'sessions#create'


  # resources :categories
  resources :companies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
