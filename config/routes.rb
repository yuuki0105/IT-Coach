Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks",registrations: "users/registrations" }

  resources :users, only: [:show]
  resources :coaches, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
