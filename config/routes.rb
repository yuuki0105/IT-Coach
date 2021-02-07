Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :users, only: [:show]
  resources :coaches, only: [:show] do
    resources :plans, only: [:new, :create, :edit, :update]
    resources :careers, only: [:new, :create, :edit, :update, :destroy]
    resources :portfolios, only: [:new, :create, :edit, :update, :destroy]
  end
  resource :mypage, only: [:edit, :update] do
    resources :user_skills, only: [:new, :create, :edit, :update, :destroy]
  end
  resource :setting, only: [:show] do
    resource :email, only: [:edit, :update], module: :settings
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
