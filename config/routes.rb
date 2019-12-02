# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show
  resources :music, only: :index
  resources :artists, param: :spotify_id, only: [:index,:show]
  resources :albums, param: :spotify_id, only: [:index,:show]
  resources :tracks, param: :spotify_id, only: [:index,:show] do
    resources :reviews, only: [:create,:edit, :update, :destroy]
    collection do
      get :search
    end
  end
  root 'music#index'
end
