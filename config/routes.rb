Rails.application.routes.draw do
  resources :categories
  devise_for :users
  root 'movies#index'

  get 'welcome/about'

  get 'welcome/contact'

  resources :movies
  
end
