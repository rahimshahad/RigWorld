Rails.application.routes.draw do

get '/signup' => 'companies#new'
post '/signup' => 'companies#create'


  # resources :categories
  resources :oilfields
  resources :rigs
  resources :companies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
