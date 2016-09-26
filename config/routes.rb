Rails.application.routes.draw do
  resources :categories
  devise_for :users
  root 'movies#index'

  get 'welcome/about'

  get 'welcome/contact'
  
    resources :movies do
    resources :reviews, except: [:index, :show]
  	member do
  		put "like" => "movies#upvote"
  		put "dislike" => "movies#downvote"
  	end
  end
end
