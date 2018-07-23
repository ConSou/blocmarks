Rails.application.routes.draw do

  get 'users/show'
  get 'likes/index'
  post :incoming, to: 'incoming#create'

  resources :topics do
    resources :bookmarks, except: [:index]
  end

  resources :bookmarks do
     resources :likes, only: [:index, :create, :destroy]
  end

  devise_for :users
  resources :users, only: [:show]
  root 'welcome#index'
end
