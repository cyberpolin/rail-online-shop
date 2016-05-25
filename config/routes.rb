Rails.application.routes.draw do

  get 'products/new'

  get 'products/show'

  get 'products/edit'

  get 'products/update'

  get 'products/destroy'

  get 'products/index'

  post 'products/index'

  resources :products

  # get 'products/index'

  root 'products#index'
end
