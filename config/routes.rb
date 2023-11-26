Rails.application.routes.draw do
  root to: "items#index"
  #resources :
  
  #devise_for :users
  #root to: "prototypes#index"
  #resources :prototypes, only: [:new, :create, :show, :edit, :update, :destroy] do
    #resources :comments, only: :create 
end