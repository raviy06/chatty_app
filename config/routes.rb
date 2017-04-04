Rails.application.routes.draw do

  root 'users#new'

  resources :rooms, only: [:new, :create, :show, :index]

  resources :users, only: [:new, :create, :index]

  resources :messages, only: :create

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
