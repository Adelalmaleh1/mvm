Rails.application.routes.draw do
  devise_for :users
  root 'welcome#home'

  get 'welcome/about'

  get 'welcome/contact'

  resources :movies
  
end
