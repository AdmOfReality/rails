Rails.application.routes.draw do

  get 'sessions/new'
  get 'users/new'

  root 'application#index'

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'

  delete '/logout', to: 'sessions#destroy'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
    resources :questions, shallow: true, exсept: :index do
      resources :answers, shallow: true, exсept: :index
    end

    member do
      post :start
    end

  end
  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
