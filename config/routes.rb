Rails.application.routes.draw do
  devise_for :users
  resources :articles

  root 'static_pages#home'
  namespace :admin do
    resources :part_ones
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
