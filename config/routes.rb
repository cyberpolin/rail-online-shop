Rails.application.routes.draw do

  get 'admin', to: 'admin#index'
  # get '/patients/:id', to: 'patients#show'
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
