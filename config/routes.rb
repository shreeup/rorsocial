Rails.application.routes.draw do
  #match 'users/:username', to: 'users#show', :via => [:get], :constraints =>{username: /[\w.]+?/}
  
  devise_for :users
  
  as :user do
    get "/users/sign_in", :to => 'devise/sessions#new'
    delete "/users/sign_out", :to => 'devise/sessions#destroy'
    get "/users/sign_up", :to => 'devise/registrations#new'
  end
  get 'users/:username', to: 'users#show', as: 'user', username: /[^\/]+/
  get 'feed', to:'feed#show'
  
  resources :users, only: :show, param: :username do
    member do
      post 'follow', to: 'follows#create', username: /[^\/]+/
      delete 'unfollow', to: 'follows#destroy', username: /[^\/]+/
    end
  end

  
  resources :items do
    member do
      post 'vote', to: 'votes#create'
      delete 'unvote', to: 'votes#destroy'
    end
  end
  
  
  root 'tweets#index'
  resources :tweets
  get 'about' => 'pages#about'
  get 'contactus' => 'pages#contactus'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
