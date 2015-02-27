Rails.application.routes.draw do

  resources :questions do
    resources :votes
    resources :comments
  end

  resources :answers do
    resources :votes
    resources :comments
  end

  root 'questions#index'

  get 'error' => 'error#error', :as =>'error'

  get '/login' => 'auth#login', :as => "login_form"
  post '/login' => 'auth#login', :as => "login"

  get '/logout' => 'auth#logout', :as => "logout"

  get '/signup' => 'auth#signup', :as => "signup_form"
  post '/signup' => 'auth#signup', :as => "signup"

  post '/upvote' => 'votes#upvote', :as => "upvote"
  post '/downvote' => 'votes#downvote', :as => "downvote"


end
