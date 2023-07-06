class Public::PostsController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update, :bookmark]

  def index
    @posts = Post.page(params[:page]).per(8)
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
    @post = Post.new(post_params)
    tags = Vision.get_image_data(post_params[:image])
    @post.user_id = current_user.id
    selected_tag_ids = Array(params[:post][:tag_ids]) # 選択されたタグのIDを取得します
    @post.tags = Tag.where(id: selected_tag_ids) # タグを関連付けます
  
    if @post.save
       tags.each do |tag|
        @post.tags.create(tag_name: tag)
      end
      redirect_to post_path(@post.id), notice: "つぶやきました"
    else
      @tags = Tag.all
      flash.now[:alert] = "少し時間を置いてみましょう"
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "更新に成功しました"
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash.now[:alert] = "機密情報は保持された"
    redirect_to posts_path
  end

  def update_tags
    @post = Post.find(params[:id])
    selected_tag_ids = Array(params[:tag_ids]) # 複数のタグを配列として受け取るため、Array() メソッドで変換します
    @post.tags = Tag.where(id: selected_tag_ids)
    redirect_to post_path(@post), notice: "タグを更新しました"
  end

  private

  def is_matching_login_user
    post_id = params[:id].to_i
    @post = Post.find_by(id: post_id, user_id: current_user.id)

    if @post.nil?
      redirect_to posts_path
    end
  end
  
  def post_params
    params.require(:post).permit(:title, :content, :image, tag_ids: [])
  end
end