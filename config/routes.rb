Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  root "home#show"

  resources :users, only: [:show] do
    resources :rooms, only: [:create], module: :users
  end

  resources :rooms, only: [:show, :index] do
    resources :messages, only: [:create], module: :rooms
  end

  resources :notifications, only: [:index]

  resources :coaches, only: [:show, :index, :create] do
    resources :plans, only: [:new, :create, :edit, :update]
    resources :careers, only: [:new, :create, :edit, :update, :destroy]
    resources :portfolios, only: [:new, :create, :edit, :update, :destroy]
    resources :abilities, only: [:new, :create, :edit, :update, :destroy]
    resources :yen_per_hours, only: [:new, :create, :edit, :update]
  end

  resource :menu, only: [:show]

  resource :mypage, only: [:show, :edit, :update] do
    resource :profile, only: [:edit, :update]
    resources :user_skills, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :user_follows, only: [:index, :create, :destroy]

  resource :setting, only: [:show] do
    resource :email, only: [:edit, :update], module: :settings
    resource :password, only: [:edit, :update], module: :settings
  end

  resource :search, only: [:show] do
    resources :skill_categories, only: [:index], param: :en_name, module: :searches do
      resources :skills, only: [:index, :show], param: :en_name, module: :skill_categories
    end
  end

  resource :about_coach, only: [:show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
