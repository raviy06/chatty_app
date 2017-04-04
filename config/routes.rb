Rails.application.routes.draw do

  root 'rooms#index'

  resources :rooms, only: [:new, :create, :show, :index]

  resources :users, only: [:new, :create, :index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
