Rails.application.routes.draw do
  devise_for :users
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

  resources :users,only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]
  
  get '/search' => 'searches#search'
  
  root to: 'homes#top'
  get '/home/about' => 'homes#about'

end