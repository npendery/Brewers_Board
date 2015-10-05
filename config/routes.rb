Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :recipes do
    resources :reviews
  end

  resources :reviews
end
