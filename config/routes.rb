# frozen_string_literal: true

Rails.application.routes.draw do
  get 'artists/index'
  get 'albums/index'
  devise_for :users
  resources :music
  resources :artists, param: :spotify_id
  resources :albums, param: :spotify_id
  resources :tracks, param: :spotify_id do
    resources :reviews
    collection do
      get :search
    end
  end
  root 'music#index'
end
