Rails.application.routes.draw do

  resources :prop_bet_sheets
  resources :super_bowls
  resources :answers
  resources :questions
authenticated :user do
  root :to => 'users#dashboard', as: :user_root
end

  root :to => 'visitors#index'
  devise_for :users
  resources :users
end
