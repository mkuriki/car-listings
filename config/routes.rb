Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'cars#index'

  resources :cars, only: [:index, :new, :create]

  resources :manufacturers, only: [:index, :new, :create]
end
