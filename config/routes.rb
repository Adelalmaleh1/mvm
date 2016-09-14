Rails.application.routes.draw do
  devise_for :users
  root 'movies#index'

  get 'welcome/about'

  get 'welcome/contact'

  resources :movies
  
end
