# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'

  resources :tasks
  resources :recurring_tasks
  devise_for :users
end
