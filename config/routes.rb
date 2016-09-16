Rails.application.routes.draw do
  # devise_for :users
  resources :articles
  resources :examinations, only: [:index] do
    resources :answer_sheets, only: [:new, :create]
  end
  resources :answer_sheets, only: [:index, :show]

  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations', sessions: "users/sessions"}

  devise_scope :user do
    authenticated :user do
      root "examinations#index", as: :authenticated_root
    end
    unauthenticated do
      root "static_pages#home", as: :unauthenticated_root
    end
  end
  root 'static_pages#home'
  get '/baokim_ed2f2d19466b8542.html' => 'static_pages#baokim'
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
  end

  SysConst::RESOURCES_TOEIC_QUESTION_TYPES.each do |question_type|
    resources question_type, except: [:edit, :update, :destroy]
  end
  SysConst::LESSON_TYPES.each do |lessons|
    resources lessons, only: :index
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
