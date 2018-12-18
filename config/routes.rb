Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  resources :users do
    get :choice, on: :collection
    post :follow, on: :member
    get :logout, on: :member
  end

  resources :items
  resources :orders

end
