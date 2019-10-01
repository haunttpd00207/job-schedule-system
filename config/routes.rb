# frozen_string_literal: true

Rails.application.routes.draw do
  root "static_pages#home"
  devise_for :users

  match '/users',   to: 'users#index',   via: 'get'

  resources :tasks do
    resources :status_update_tasks, only: :update
    resources :restores, only: :update
  end

  resources :chatrooms do
    resource :chatroom_users
    resources :messages
  end

  resources :recurring_tasks
  resources :direct_messages

end
