Rails.application.routes.draw do

  get 'guests/user_guest'
  get 'guests/admin_guest'
  get 'searches/search'

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

  scope module: :public do
    resources :users, only:[:index, :show, :update, :edit, :show] do
      member do
        get 'bookmarks' =>'bookmarks#index'
        get 'comments' =>'comments#index'
      end
    end
    resources :posts, only:[:show, :index, :create, :destroy, :new, :edit, :update] do
      resource :bookmarks, only: [:create, :destroy]
      resources :comments, only:[:create, :destroy]
    end
    root to: 'homes#top'
    get "/about" => "homes#about"
    resources :tags, only:[:create, :index, :show, :destroy]
    put "/users/:id/hide" => "users#hide", as: 'users_hide'
  end

    resources :notifications, only: :index
    post '/guests/user_login', to: 'guests#user_guest'
    post '/guests/admin_login', to: 'guests#admin_guest'
end
