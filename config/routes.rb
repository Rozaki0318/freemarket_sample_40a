Rails.application.routes.draw do
  root 'items#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users do
    get :choice, on: :collection
    post :follow, on: :member
    get :logout, on: :member
    get :edit, on: :member
    get :identification, on: :member
<<<<<<< HEAD
=======
    # resources :items, except: :index
    resources :cards, :only => [:index, :new, :create, :destroy]
>>>>>>> 71671bd548fc5c5b40fa9bf818d57d5a9a157549
  end
  resources :items
  resources :orders
  resources :categories do
    get :select_top, on: :collection
    get :select_mid, on: :collection
  end
end
