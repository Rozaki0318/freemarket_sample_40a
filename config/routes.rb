Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  resources :users do
    get :choice, on: :collection
    post :follow, on: :member
    get :logout, on: :member
    get :registercard, on: :member
    get :edit, on: :member
    get :identification, on: :member
    # resources :items, except: :index
  end

  resources :items
  resources :orders

end
