Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end

  unauthenticated :user do
    root to: 'splash#first_screen', as: :unauthenticated_root
  end

  get '/splash#index', to: 'splash#index', as: 'splash'
  get '/splash#first_screen', to: 'splash#first_screen', as: 'splashx'

  get '/categories#sign_out', to: 'categories#sign_out', as: 'sign_out'
 
  resources :categories, only: [:index, :show, :new, :create]
  resources :products, only: [:new, :create]
end
