Rails.application.routes.draw do
  root 'static_pages#home'
  
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'log_out', to: 'sessions#destroy', as: 'log_out'

  resources :users, only: [:show]
  resources :sessions, only: %i[create destroy]
  resources :lookbacks, only: [:create, :destroy, :show, :edit, :update]
end
