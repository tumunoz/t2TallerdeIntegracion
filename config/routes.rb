Rails.application.routes.draw do
  resources :users
  
  root to: 'users#index'
  
  put 'users', to: 'users#create'
  put 'usuario', to: 'users#create'
  
  get 'usuario/:id', to: 'users#show'
  get 'usuario',  to: 'users#index'
  
  post 'usuario/:id' , to: 'users#update'
  
  delete 'usuario/:id', to: 'users#destroy'

end
