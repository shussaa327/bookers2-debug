Rails.application.routes.draw do
  root 'home#top'
  get 'home/about' => "home#about"
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resource :comments, only: [:create, :destroy]
  end
end