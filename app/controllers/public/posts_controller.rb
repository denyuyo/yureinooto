class Public::PostsController < ApplicationController
  
  def index
    @posts = Post.all
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: '投稿情報が更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: '投稿が削除されました。'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
