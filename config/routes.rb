# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tests#index'
  get 'contact', to: 'contacts#new'
  post 'contact', to: 'contacts#create'

  devise_for :users, path: :app_users, path_names: { sign_in: :login, sign_out: :logout },
                     controllers: { sessions: 'users/sessions' }

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, exсept: :index do
        resources :answers, shallow: true, exсept: :index
      end
    end
    resources :gists, only: [:index]
  end

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end
end
