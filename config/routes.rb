Rails.application.routes.draw do
  # root 'posts#index'
  root "users#index"
  devise_for :users
  resources :users
  resources :posts do
    resources :likes
    resources :comments    
  end
  # resources :comments
end
