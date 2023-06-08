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
  
  resources :posts, only: [:index, :create, :show, :edit, :destroy]
   resource :bookmarks,  only: [:index, :create, :show, :destroy]
   
   
   # ユーザープロフィール関連
  get '/users/profile/:id', to: 'public/users#show', as: 'user_profile'
  get '/users/profile/:id/edit', to: 'public/users#edit', as: 'edit_user_profile'
  patch '/users/profile', to: 'public/users#update', as: 'update_user_profile'

  # ユーザー一覧と詳細
  get '/users', to: 'public/users#index', as: 'users'
  get '/users/:id', to: 'public/users#show', as: 'user'
  
# end

end
