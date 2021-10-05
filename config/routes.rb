Rails.application.routes.draw do
  root to: 'diaries#index'
  devise_for :users
  resources :diaries, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
  resources :comments, only: :create 
  end
  resources :users, only: :show
end
