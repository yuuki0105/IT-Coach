Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  root "home#show"

  resources :users, only: [:show] do
    resources :rooms, only: [:create], module: :users
  end

  resource :reset_password, only: [:show, :create, :edit, :update]

  resources :rooms, only: [:show, :index] do
    resources :messages, only: [:create], module: :rooms
  end

  resources :notifications, only: [:index]

  resources :coaches, only: [:show, :index, :create] do
    resources :careers, only: [:new, :create, :edit, :update, :destroy]
    resources :portfolios, only: [:new, :create, :edit, :update, :destroy]
    resources :abilities, only: [:new, :create, :edit, :update, :destroy]
    resources :yen_per_hours, only: [:new, :create, :edit, :update]
  end

  namespace :registrations do
    resource :image, only: [:show, :update]
    resource :profile, only: [:show, :update]
    resource :user_skills, only: [:show, :update]
    resource :abilities, only: [:show, :update]
    resource :yen_per_hours, only: [:show, :update]
    resource :careers, only: [:show, :update]
    resource :portfolios, only: [:show, :update]
    resource :examination_interview_date, only: [:show, :update]
  end

  resource :menu, only: [:show]

  resource :mypage, only: [:show, :edit, :update] do
    resource :profile, only: [:edit, :update]
    resources :user_skills, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :user_follows, only: [:index, :create, :destroy]

  resources :user_want_skills, only: [:new, :create]

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
