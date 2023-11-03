Rails.application.routes.draw do
  devise_for :listeners
  devise_for :artists

  root to: 'artists/home#index'

  namespace :artists do
    resources :home, only: [:index]
    root to: 'home#index'

    resources :albums do
      resources :songs, except: [:index, :show]
    end
  end

  namespace :listeners do
    root to: 'home#index'
    resources :home, only: [:index]
    resources :followers, only: [:create, :destroy]
  end
end
