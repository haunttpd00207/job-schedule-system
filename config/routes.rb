# frozen_string_literal: true

Rails.application.routes.draw do
  root "static_pages#home"
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

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
  resources :reports

  post "direct_messages/:user_id", to: "direct_messages#create"
  resources :suggests

  scope :users do
    resources :workings, only: [:create, :update]
  end

  namespace :admin do
    root "suggests#index"
    resources :suggests
  end
end
