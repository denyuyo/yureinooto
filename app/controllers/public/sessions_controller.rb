class Public::SessionsController < Devise::SessionsController
  def create
    # パラメータからユーザー名とパスワードを取得
    username = params[:user][:name]
    password = params[:user][:password]

    # ユーザーの認証を行う
    user = User.find_by(name: username)
    if user && user.valid_password?(password)
      sign_in(user) # ユーザーをログイン状態にする
      redirect_to root_path, notice: "ログインしました" # ログイン成功時のリダイレクト先を設定
    else
      redirect_to new_user_session_path, alert: "ログインに失敗しました" # ログイン失敗時のリダイレクト先を設定
    end
  end
  
  def destroy
    sign_out(current_user) # ユーザーをログアウト状態にする
    redirect_to root_path, notice: "ログアウトしました" # ログアウト成功時のリダイレクト先を設定
  end
end
