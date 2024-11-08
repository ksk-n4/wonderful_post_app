Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index' # 追記
  resources :sample_articles
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
