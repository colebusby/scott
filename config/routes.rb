Scott::Application.routes.draw do
  root to: 'welcome#index'

  resources :welcome, only: [:index]

  resources :users, only: [:new]

  post 'signin', to: 'sessions#create'
end
