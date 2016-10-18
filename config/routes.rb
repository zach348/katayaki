Rails.application.routes.draw do
  root 'static_pages#index'

  devise_for :users

  resources :users, only: [:index, :show, :update, :edit, :destroy]
  resources :goals, only: [:new]
  resources :aspirations, only: [:new, :create, :show, :destroy]
  resources :static_pages, only: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
