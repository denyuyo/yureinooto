Rails.application.routes.draw do

# ユーザー用
devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
      resources :users, only: [:index, :show, :destroy]
      resources :comments, only: [:index, :show, :destroy]
      resources :posts, only: [:index, :show, :destroy]
    end

# scope module: :public do

  root to: "public/homes#top"
  get "/about" => "public/homes#about"

  namespace :public do
    resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :bookmarks, only: [:index, :create, :update, :destroy]
    resources :comments, only: [:new, :create, :index, :destroy]
    resources :users, only: [:index, :show, :edit, :update]
  end

end
