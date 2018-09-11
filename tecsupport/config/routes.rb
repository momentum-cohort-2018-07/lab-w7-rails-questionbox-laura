Rails.application.routes.draw do
  resources :questions
  resources :answers

  resources :users

  root 'question#index'
  resource :session, only: [:new, :create, :destroy]

  resources :sessions, :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
