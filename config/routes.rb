Rails.application.routes.draw do
  # devise_for :users
  resources :articles
  resources :examinations, only: [:index] do
    resources :answer_sheets, only: [:new, :create]
    post 'buy_examination', on: :member
  end
  resources :answer_sheets, only: [:index, :show]

  resources :words do
    put 'update_origin', on: :member
    put 'update_status', on: :member
    put 'update_meaning', on: :member
  end

  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations', sessions: "users/sessions"}

  devise_scope :user do
    authenticated :user do
      root "static_pages#home", as: :authenticated_root
    end
    unauthenticated do
      root "static_pages#home", as: :unauthenticated_root
    end
  end

  resources :point_recharging, only: [:new, :create]

  root 'static_pages#home'
  get '/baokim_ed2f2d19466b8542.html' => 'static_pages#baokim'
  get '/nganluong_5f7805dbf7c25c1d449f32552ec4a8bb.html' => 'static_pages#nganluong'
  namespace :admin do
    SysConst::RESOURCES_TOEIC_QUESTION_TYPES.each do |question_type|
      resources question_type
    end
    resources :examinations
    SysConst::LESSON_TYPES.each do |lessons|
      resources lessons
    end
    resources :readings
    resources :listenings
    resources :users do
      patch 'update_point', on: :member
    end
    resources :questions, only: :update do
      post 'import', on: :collection
      get 'import', on: :collection
    end

    resources :subjects
  end

  namespace :toeic do
    resources :documents
  end

  resources :cards, only: [:index]

  resources :users do
    post "like_page", on: :collection
    post "unlike_page", on: :collection
    post "share_page", on: :collection
    get "words", on: :member
  end

  SysConst::RESOURCES_TOEIC_QUESTION_TYPES.each do |question_type|
    resources question_type, except: [:edit, :update, :destroy]
  end
  SysConst::LESSON_TYPES.each do |lessons|
    resources lessons, only: :index
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
