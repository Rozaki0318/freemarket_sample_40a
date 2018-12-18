Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  resources :users do
    get :choice, on: :collection
    get :logout, on: :collection
  end

  resources :items
  resources :orders

end
