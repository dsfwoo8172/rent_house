Rails.application.routes.draw do
  root 'rent_houses#index'
  resources :rent_houses
  
  get '/user/sign_up', to: 'registrations#new'
  post '/user/sign_up', to: 'registrations#create'
  
  delete '/user/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
