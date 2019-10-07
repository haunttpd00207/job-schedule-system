# frozen_string_literal: true

Rails.application.routes.draw do
  root "static_pages#home"
  devise_for :users

  match '/users', to: 'users#index', via: 'get'

  resources :tasks do
    resources :status_update_tasks, only: :update
    resources :restores, only: :update
  end

  resources :chatrooms do
    resource :chatroom_users
    resources :messages
  end

  resources :holidays, only: :index
  resources :recurring_tasks
  resources :direct_messages, only: :show

  post "direct_messages/:user_id", to: "direct_messages#create"
  resources :recurring_tasks
  resources :reports
end
