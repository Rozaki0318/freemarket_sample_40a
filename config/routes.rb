Rails.application.routes.draw do
  root 'items#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users do
    get :choice, on: :collection
    post :follow, on: :member
    get :logout, on: :member
    get :edit, on: :member
    get :identification, on: :member
    resources :cards, :only => [:index, :new, :create, :destroy]
  end
  resources :items
  resources :orders
  resources :categories do
    get :select_top, on: :collection
    get :select_mid, on: :collection
  end
end
