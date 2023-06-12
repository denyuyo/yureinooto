class Public::UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]

  def index
    @users = User.all
    @post = Post.new
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "新しいキミになったよ！"
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile_image)
  end
  
  def ensure_correct_user
    if current_user.nil?
      redirect_to edit_user_path
    else
      @user = User.find(params[:id])
      unless @user == current_user
        redirect_to user_path(current_user.id), notice: "他のユーザーの情報は編集できません"
      end
    end
  end
end