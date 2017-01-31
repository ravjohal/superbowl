Rails.application.routes.draw do

  resources :prop_bet_sheets
  resources :super_bowls
  resources :answers
  resources :questions
  resources :prop_bets
authenticated :user do
  root :to => 'prop_bet_sheets#index', as: :user_root
end

  root :to => 'visitors#index'
  devise_for :users
  resources :users

  get '/pastwinners' => 'users#past_winners', as: :past_winners
end
