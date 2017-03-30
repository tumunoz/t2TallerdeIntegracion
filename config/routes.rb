Rails.application.routes.draw do
  resources :users

  put 'users', to: 'users#create'
  
end
