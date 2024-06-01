Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'posts/:post_id/likes' => 'likes#create'
  get 'posts/:post_id/likes/:id' => 'likes#destroy'
  resources :posts
  root 'posts#top'

  resources :posts do
    resources :likes, only: [:create, :destroy]

    resources :comments, only: [:create, :destroy]

    resources :reactions, only: [:create]
  end

end
