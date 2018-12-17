Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  resources :users do
    get :choice, on: :collection
    post :follow, on: :member
  end

  resources :items
end
