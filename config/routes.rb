Scott::Application.routes.draw do
  root to: 'welcome#index'

  resources :welcome, only: [:index]

  resources :users, only: [:new, :create]

  post 'signin', to: 'sessions#create'
  get 'signout', to: 'sessions#destroy'

  get 'register', to: 'users#new'

  resources :products, only: [:index, :show]
end
