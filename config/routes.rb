Rails.application.routes.draw do

  root 'rooms#index'

  get 'rooms/new'

  post 'rooms/create'

  get 'rooms/show'

  get 'users/index'

  get 'users/new'

  post 'users/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
