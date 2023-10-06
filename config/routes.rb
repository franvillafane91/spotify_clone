Rails.application.routes.draw do
  devise_for :artists

  namespace :artists do
    resources :home, only: :index
    root to: 'home#index'
  end
end
