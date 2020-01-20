Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  resources :users, only: [:show, :new, :create, :edit, :update]
  
  resources :items, only: [:show, :new]

  resources :favorites, only: [:create, :destroy]
  
  resources :details, only: [ :new, :create, :edit, :update, :destroy]
end
