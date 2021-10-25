Rails.application.routes.draw do
  root 'static_pages#home'
  
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'log_out', to: 'sessions#destroy', as: 'log_out'

  resources :users, only: [:show]
  resources :sessions, only: %i[create destroy]
  resources :lookbacks, only: [:index, :create, :destroy, :show, :edit, :update, :new]
  resources :lookback_details, only: [:create, :destroy, :update]
  resources :reviews, only: [:index, :create, :destroy, :update]
  resources :subject, only: [:create, :destroy, :update]
end
