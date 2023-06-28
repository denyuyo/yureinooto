class Admin::UsersController < ApplicationController
  before_action :hide_withdrawn_user, only: [:index, :show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "ユーザーを改訂しました"
    else
      render :edit
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def revive
    @user = User.find(params[:id])
  
    if @user.update(is_deleted: false)
      flash[:notice] = "ユーザーが復活しました"
      redirect_to admin_user_path(@user)
    else
      flash[:alert] = "ユーザーの復活に失敗しました"
      redirect_to root_path
    end
  end
  
  def hide_withdrawn_user
    if current_user&.withdrawn?
      flash[:alert] = "ユーザーの退会処理が完了しました"
      redirect_to admin_users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_image)
  end
end
