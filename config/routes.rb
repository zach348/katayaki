Rails.application.routes.draw do
  root 'static_pages#index'

  devise_for :users

  resources :users, only: [:index, :show, :update, :edit, :destroy]
  resources :goals, only: [:new, :show, :index]
  resources :aspirations, only: [:index, :create, :show, :destroy]
  resources :static_pages, only: [:index]
  resources :groups, only: [:index, :create]
  resources :affiliations, only: [:create, :index]

  get 'location' => 'users#location'
  patch 'location' => 'users#update_location'
  get 'rate' => 'ratings#rate'
  post 'endorse' => 'ratings#endorse'
  get 'search' => 'goals#search'
  get 'markers' => 'aspirations#markers'
  post 'incoming_messages' => 'incoming_messages#create'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
