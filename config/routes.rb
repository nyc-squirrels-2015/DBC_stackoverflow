Rails.application.routes.draw do


  resources :questions do
    get '/upvote' => 'votes#upvote_form', :as => 'upvote_form'
    post '/upvote' => 'votes#upvote', :as => 'upvote'
    get '/downvote' => 'votes#downvote_form', :as => 'downvote_form'
    post '/downvote' => 'votes#downvote', :as => 'downvote'
    resources :comments
  end

  resources :answers do
    get '/upvote' => 'votes#upvote_form', :as => 'upvote_form'
    post '/upvote' => 'votes#upvote', :as => 'upvote'
    get '/downvote' => 'votes#downvote_form', :as => 'downvote_form'
    post '/downvote' => 'votes#downvote', :as => 'downvote'
    resources :comments
  end

  root 'questions#index'

  get 'error' => 'error#error', :as =>'error'

  get '/login' => 'auth#login_form', :as => "login_form"
  post '/login' => 'auth#login', :as => "login"

  get '/logout' => 'auth#logout', :as => "logout"

  get '/signup' => 'auth#signup_form', :as => "signup_form"
  post '/signup' => 'auth#signup', :as => "signup"

  post '/upvote' => 'votes#upvote', :as => "upvote"
  post '/downvote' => 'votes#downvote', :as => "downvote"


end
