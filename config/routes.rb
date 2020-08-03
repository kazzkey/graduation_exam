Rails.application.routes.draw do
  root 'home#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: { sessions: 'users/sessions' }

  resource :user, only: %i(show edit update)

  resources :answer_sheets, only: %i(index show result) do
    get :result, on: :member
    resources :comments, only: %i(create edit update destroy)
  end

  namespace :teacher do
    root 'home#index'
    resources :users, only: %i(index show)
    resources :answer_sheets, only: %i(index show result) do
      get :result, on: :member
    end
  end

  resources :subjects, only: %i(index create edit update destroy)

  resources :exams do
    resources :answer_sheets, only: %i(new create result) do
      get :result, on: :member
    end
  end
end
