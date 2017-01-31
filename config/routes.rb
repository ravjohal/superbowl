Rails.application.routes.draw do

  devise_for :users do
      get "sign_out", :to => "devise/sessions#destroy"
  end
  resources :users
  resources :prop_bet_sheets
  resources :super_bowls
  resources :answers
  resources :questions
  resources :prop_bets
authenticated :user do
  root :to => 'prop_bet_sheets#index', as: :user_root
end

  root :to => 'visitors#index'
  

  get '/pastwinners' => 'users#past_winners', as: :past_winners
end
