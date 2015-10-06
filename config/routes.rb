Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :recipes do
    resources :reviews
  end

  resources :reviews

  resources :users, only: [:index, :show]

  resources :groups

  resources :memberships, only: [:create, :destroy]
end
