Rails.application.routes.draw do
  devise_for :users
  resources :music
  resources :tracks do
    resources :reviews
    collection do
      get :search
    end
  end
  root 'music#index'
end
