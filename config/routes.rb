Rails.application.routes.draw do
  #トップページ
  root to: "toppages#index"
  
  #ログイン機能
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  #ユーザー登録機能
  get "signup", to: "users#new"
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get "followings"
      get "followers"
    end
  end
  #投稿機能
  resources :microposts, only: [:create, :destroy]
  
  #フォロー機能
  resources :relationships, only: [:create, :destroy]
end
