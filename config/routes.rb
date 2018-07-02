Rails.application.routes.draw do
  devise_for :users
  
  root 'home#index'
  
  get 'home/index'
  
  get 'home/new'

  post 'home/create'
  post 'home/search'

  get 'home/destroy/:post_id' => 'home#destroy'
  
  get 'home/edit/:post_id' => 'home#edit'
  
  get 'home/readall' => 'home#readall'
  post 'home/update/:post_id' => 'home#update'
  
  get 'home/mypost/:user_id' => 'home#mypost'
  

  resources :search

  
end
