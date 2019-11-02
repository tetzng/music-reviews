Rails.application.routes.draw do
  root 'music#index'
  resources :music do
    collection do
      get :search
    end
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
