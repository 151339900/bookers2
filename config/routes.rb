Rails.application.routes.draw do
  get 'top' => 'homes#top'
 post 'books' => 'books#create' 
  devise_for :users
  root to: 'homes#top'
  get 'books' => 'books#index'
  get 'home/about', to: 'homes#about'
  
  
  resources :users, only: [:index, :show, :edit, :update ,:edit ,:destroy] 
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update]
end
