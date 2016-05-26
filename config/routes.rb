Rails.application.routes.draw do


  resources :categories do
    resources :products
  end

  get 'admin', to: 'admin#index'
  # get '/patients/:id', to: 'patients#show'
  # get 'products/new'

  # get 'products/show'

  # get 'products/edit'

  # get 'products/update'

  # get 'products/destroy'

  # get 'products/index'

  # post 'products/index'

  resources :products

  resources :users

  resources :sessions

  get 'sessions/new'

  get 'logout', to: 'sessions#delete'

  # get 'products/index'

  root 'products#index'
end
