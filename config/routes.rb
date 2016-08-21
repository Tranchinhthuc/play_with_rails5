Rails.application.routes.draw do
  # devise_for :users
  resources :articles
  resources :examinations, only: [:index] do
    resources :answer_sheets, only: [:new, :create]
  end
  resources :answer_sheets, only: [:index, :show]

  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations'}

  root 'static_pages#home'
  namespace :admin do
    resources :part_ones
    resources :part_twos
    resources :part_threes
    resources :part_fours
    resources :part_fives
    resources :part_sixes
    resources :part_seven_ones
    resources :part_seven_twos
    resources :examinations
    resources :readings
    resources :listenings
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
