Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users, path: :app_users, path_names: { sign_in: :login, sign_out: :logout },
  controllers: { sessions: 'users/sessions' }

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, exсept: :index do
        resources :answers, shallow: true, exсept: :index
      end
    end
  end

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

end
