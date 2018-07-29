Rails.application.routes.draw do
  get 'usertasks/create'
  resources :tasks, only: :index do
    resources :usertasks, only: :create
  end

  resources :usertasks, only: :index

  root to: 'tasks#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end