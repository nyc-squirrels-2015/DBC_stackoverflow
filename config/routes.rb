Rails.application.routes.draw do
  resources :questions, :answers, :comments
end
