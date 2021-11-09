Rails.application.routes.draw do
  root 'static_pages#home'
  
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'log_out', to: 'sessions#destroy', as: 'log_out'

  resources :users, only: [:show]
  resources :sessions, only: %i[create destroy]
  resources :lookbacks
  resources :lookback_details, only: [:create, :destroy, :update]
  resources :reviews, only: [:index, :create, :destroy, :update]
  resources :subjects, only: [:create, :destroy, :update]
  resources :dones, only: [:create, :index, :destroy]
  get 'sitemap', to: redirect('https://s3-ap-northeast-1.amazonaws.com/nagasho-lookback/sitemaps/sitemap.xml.gz')
end
