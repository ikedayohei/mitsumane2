Rails.application.routes.draw do
  devise_for :users
  root "estimates#index"
  resources :estimates do
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show,:edit,:update]
end
