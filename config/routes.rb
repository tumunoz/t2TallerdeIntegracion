Rails.application.routes.draw do
  resources :users
  root to: 'users#index'
  put 'users', to: 'users#create'
  
end
