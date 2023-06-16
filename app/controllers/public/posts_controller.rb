class Public::PostsController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update, :bookmark]

  def index
    @posts = Post.all
  end

  def show
    @mypost = Post.find(params[:id])
    @mypost.update(viewcount: @mypost.viewcount + 1)
    @user = @mypost.user
    @post = Post.new
    @tags = @mypost.tags
    @comment = Comment.new
    @bookmark_count = @mypost.bookmarks.count
  end

  def edit
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @tag = Tag.new
    @tags = Tag.all
  end

  def create
    post_params = params.require(:post).permit(:title, :content, tag_ids: [])
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post.id), notice: "キミの情報は頂いた！"
    else
      @posts = Post.all
      flash.now[:alert] = "なぬっ...!そうきたか"
      render 'index'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "うむ...！"
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "機密情報は保持された"
  end
  
  def update_tags
    @post = Post.find(params[:id])
    selected_tag_ids = Array(params[:tag_ids]) # 複数のタグを配列として受け取るため、Array() メソッドで変換します
    @post.tags = Tag.where(id: selected_tag_ids)
    redirect_to post_path(@post), notice: "タグを更新しました"
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def is_matching_login_user
    post_id = params[:id].to_i
    @post = Post.find_by(id: post_id, user_id: current_user.id)

    if @post.nil?
      redirect_to posts_path
    end
  end
end