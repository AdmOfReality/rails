Rails.application.routes.draw do

  root 'test#index'

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
