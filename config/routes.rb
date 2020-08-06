Rails.application.routes.draw do
  root 'home#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  devise_scope :user do
    post 'users/guest_student_sign_in', to: 'users/sessions#guest_student'
    post 'users/guest_teacher_sign_in', to: 'users/sessions#guest_teacher'
  end

  resource :user, only: %i(show)

  resources :answer_sheets, only: %i(index show result) do
    get :result, on: :member
    resources :comments, only: %i(create edit update destroy)
  end

  resources :notifications, only: %i(index destroy_all) do
    delete :destroy_all, on: :collection
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

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
