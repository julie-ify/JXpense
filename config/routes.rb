Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end

  unauthenticated :user do
    root to: 'splash#first_screen', as: :unauthenticated_root
  end

  get '/splash', to: 'splash#index'
  get '/splash/first_screen', to: 'splash#first_screen', as: 'splashx'

  get '/sign_out', to: 'categories#sign_out', as: 'sign_out'
 
  resources :categories, only: [:index, :show, :new, :create, :update, :destroy, :edit] do
    resources :products, only: [:new, :create, :update, :destroy, :edit, :show]
  end
end
