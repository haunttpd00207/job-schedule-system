# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'

<<<<<<< HEAD
  resources :tasks
  resources :recurring_tasks
=======
>>>>>>> user_basic_function
  devise_for :users
end
