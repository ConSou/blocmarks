Rails.application.routes.draw do

  get 'likes/index'
  post :incoming, to: 'incoming#create'

  resources :topics do
    resources :bookmarks, except: [:index]
  end

  resources :bookmarks do
     resources :likes, only: [:index, :create, :destroy]
  end
  
  devise_for :users
  root 'welcome#index'
end
