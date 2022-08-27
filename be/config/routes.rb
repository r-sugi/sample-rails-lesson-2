# frozen_string_literal: true
Rails.application.routes.draw do
  get '/' => "static_pages#home"
  get 'signup'  => 'users#new'
  resources :users
end
