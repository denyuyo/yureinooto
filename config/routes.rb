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

  namespace :public do
    root to: "homes#top"
    get "/about" => "homes#about"

    resources :posts, only: [:index, :show, :edit, :create, :destroy, :update] do
      resource :bookmarks, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end

    resources :users, only: [:index, :show, :edit, :update]
  end

end
