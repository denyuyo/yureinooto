class Public::UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]
  before_action :ensure_guest_user, only: [:edit]
  before_action :hide_withdrawn_user

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
    @user = User.find(params[:id])
  
    if params[:user][:profile_image].present?
      # アップロードされたファイルを保存する処理
      @user.profile_image.attach(params[:user][:profile_image])
    end
  
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "新しいキミになったよ！"
    else
      render "edit"
    end
  end
  
  def hide
		@user = User.find(params[:id])
		#is_deletedカラムにフラグを立てる(defaultはfalse)
  	@user.update(is_deleted: true)
  	#ログアウトさせる
  	reset_session
  	flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております"
  	redirect_to root_path
	end
	
	def hide_withdrawn_user
    redirect_to(root_path) if current_user&.withdrawn?
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
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
    redirect_to user_path(current_user), notice: "ゲストユーザーはプロフィール編集画面へ遷移できません"
    end
  end
end