# frozen_string_literal: true

Rails.application.routes.draw do
  root "static_pages#home"
  devise_for :users

  match '/users', to: 'users#index', via: 'get'

  get "/search", to: "chatrooms#search_chatroom", as: "search_chatroom"
  get "/search_user", to: "users#search_user", as: "search_user"
  get "/autocomplete", to: "chatrooms#autofilltext"
  get "/getusers", to: "users#autofilltext"
  resources :tasks do
    resources :status_update_tasks, only: :update
    resources :restores, only: :update
  end

  resources :chatrooms do
    resource :chatroom_users
    resources :messages
  end

  resources :holidays, only: :index
  post "add_user/:user_id", to: "add_users#create", as: "add_user"

  resources :recurring_tasks
  resources :direct_messages, only: :show
  resources :reports

  post "direct_messages/:user_id", to: "direct_messages#create"

  scope :users do
    resources :workings, only: [:create, :update]
  end
end
