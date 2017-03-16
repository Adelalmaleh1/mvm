Rails.application.routes.draw do
  devise_for :admins
  resources :categories
  devise_for :users
  root 'movies#index'

  get 'welcome/about'

  get 'welcome/contact'
  
    resources :movies do
      collection do
        get 'search'
      end
      resources :reviews, except: [:index, :show]
  	member do
  		put "like" => "movies#upvote"
  		put "dislike" => "movies#downvote"
  	end
  end
end
