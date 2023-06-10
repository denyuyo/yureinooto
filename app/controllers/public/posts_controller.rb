class Public::PostsController < ApplicationController

  before_action :is_matching_login_user, only: [:edit, :update]

  def index
    @posts = Post.all
  end

  def show
    @mypost = Post.find(params[:id])
    # 閲覧数の追加
    @mypost.update(viewcount: @mypost.viewcount + 1)

    @user = @mypost.user
    @post = Post.new
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to public_post_path(@post.id), notice: "キミの情報は頂いた！"
    else
      @posts = Post.all
      flash.now[:alert] = "なぬっ...!そうきたか"
      render 'index'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to public_post_path(@post), notice: "うむ...！"
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to public_posts_path, notice: "機密情報は保持された"
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def is_matching_login_user
    post = Post.find(params[:id])
    unless post.user.id == current_user.id
      redirect_to public_posts_path
    end
  end
end
