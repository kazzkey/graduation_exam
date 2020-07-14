Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#index'
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :exams
end
