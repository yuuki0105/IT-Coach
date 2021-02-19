Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :users, only: [:show] do
    resources :rooms, only: [:create], module: :users
  end

  resources :rooms, only: [:show, :index] do
    resources :messages, only: [:create], module: :rooms
  end

  resources :coaches, only: [:show, :index] do
    resources :plans, only: [:new, :create, :edit, :update]
    resources :careers, only: [:new, :create, :edit, :update, :destroy]
    resources :portfolios, only: [:new, :create, :edit, :update, :destroy]
  end

  resource :menu, only: [:show]

  resource :mypage, only: [:show, :edit, :update] do
    resource :profile, only: [:edit, :update]
    resources :user_skills, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :user_follows, only: [:index, :create, :destroy]

  resource :setting, only: [:show] do
    resource :email, only: [:edit, :update], module: :settings
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
