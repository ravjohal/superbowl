Rails.application.routes.draw do

  resources :propbetsheets
authenticated :user do
  root :to => 'users#dashboard', as: :user_root
end

  root :to => 'visitors#index'
  devise_for :users
  resources :users
end
