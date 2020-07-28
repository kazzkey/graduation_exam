Rails.application.routes.draw do
  root 'home#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: { sessions: 'users/sessions' }

  resource :user, only: %i(show edit update)

  resources :answer_sheets, only: %i(result) do
    get :result, on: :member
  end

  resources :exams do
    resources :answer_sheets, only: %i(new create result) do
      get :result, on: :member
    end
  end
end
