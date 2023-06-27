class Public::SessionsController < Devise::SessionsController
  before_action :reject_user, only: [:create]
  
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
  
  protected
  # 退会しているかを判断するメソッド
  def user_state
    ## 【処理内容1】 入力されたnameからアカウントを1件取得
    @user = User.find_by(email: params[:user][:name])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@user
    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    ## 【処理内容3】 1と２がtrueならサインアップ画面に遷移
    if @user.valid_password?(params[:user][:password]) && @user.user_status == "withdraw"
      flash[:notice] = "退会済のアカウントです。"
      redirect_to new_user_registration_path
    end
  end
  
  def reject_user
    @user = User.find_by(name: params[:user][:name].downcase)
    if @user
      if (@user.valid_password?(params[:user][:password]) && (@user.active_for_authentication? == false))
        flash[:error] = "退会済みです。"
        redirect_to new_user_session_path
      end
    else
      flash[:error] = "必須項目を入力してください。"
    end
  end
end
