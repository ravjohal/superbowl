Rails.application.routes.draw do

  get 'admin/setup'
  resources :messages
  devise_for :users do 
    get '/users/sign_out' => 'devise/sessions#destroy' 
  end
  resources :users
  resources :prop_bet_sheets
  resources :super_bowls
  resources :answers
  resources :questions
  resources :prop_bets
authenticated :user do
  root :to => 'prop_bet_sheets#latest_sheet', as: :user_root
end

  root :to => 'visitors#index'
  
  get '/all_prop_bet_sheets' => 'prop_bet_sheets#all_prop_bet_sheets', as: :all_prop_bet_sheets
  get '/pastwinners' => 'users#past_winners', as: :past_winners
  get '/all_questions' => 'questions#all_questions', as: :all_questions
  get '/all_answers' => 'answers#all_answers', as: :all_answers
end
