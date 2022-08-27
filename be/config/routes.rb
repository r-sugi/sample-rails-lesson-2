# frozen_string_literal: true
Rails.application.routes.draw do
  get '/' => "static_pages#home"
  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users
end
