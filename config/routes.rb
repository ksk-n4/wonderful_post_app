Rails.application.routes.draw do
  get '/mypage', to: 'mypage#index'
  devise_for :users
  root to: 'articles#index'
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
