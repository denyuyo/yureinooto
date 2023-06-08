class Public::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    # ユーザーの詳細情報を表示するための処理
  end

  def edit
    # プロフィール編集画面を表示するための処理
  end

  def update
    if @user.update(user_params)
      redirect_to profile_path, notice: 'ユーザープロフィールが更新されました。'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end
end
