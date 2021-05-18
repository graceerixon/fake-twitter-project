Rails.application.routes.draw do
  root 'tweets#index'

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users do
    get 'profile'
  end
  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"

  resources :tweets do
    member do
      put "like", :to => "tweets#like"
      put "dislike", :to => "tweets#dislike"
    end
  end
end
