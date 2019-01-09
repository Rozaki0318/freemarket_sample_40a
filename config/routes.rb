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
    resources :orders, only: :index do
      get :sale, on: :collection
      post :pay, on: :member
    end
  end
  resources :items do
    # get :search, on: :collection
    collection do
      match 'search' => 'items#search', via: [:get, :post], as: :search
    end
    get :option, on: :member
    resources :orders, only: [:new, :create, :show, :update, :destroy]
    resources :comments, only: [:create]
  end

  resources :categories do
    get :select_top, on: :collection
    get :select_mid, on: :collection
  end

  resources :brands do
    get :search, on: :collection
    get :submit, on: :collection
  end

  resources :sizes, only: :index
end
