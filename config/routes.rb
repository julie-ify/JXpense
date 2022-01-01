Rails.application.routes.draw do
  # get 'categories/index'
  # get 'splash/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end

  unauthenticated :user do
    root to: 'splash#index'
  end
end
