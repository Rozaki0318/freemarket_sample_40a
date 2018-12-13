Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'test' => 'tests#index' # Basic認証導入のテスト用@2018.12.13 Ozaki
end
