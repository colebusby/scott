Scott::Application.routes.draw do
  root to: 'welcome#index'

  resources :welcome, only: [:index]

  resources :users, only: [:create]

  post 'signin', to: 'sessions#create'
  get 'signout', to: 'sessions#destroy'

  get 'register', to: 'users#new'

  resources :products, only: [:index, :show, :create]
  get 'add_new_treat', to: 'products#new'

  resources :line_items, only: [:index, :create, :destroy]

  resources :charges
end
