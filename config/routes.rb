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

# scope module: :public do
 
  get '/', to: 'public/homes#top'
  get '/about', to: 'public/homes#about'
  
  resources :posts, only: [:index, :create, :show, :edit, :destroy]
  
# end

end
