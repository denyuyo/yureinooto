class Admin::PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page]).per(4)
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comments = @post.comments
    @bookmark_count = @post.bookmarks.count
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_user_path(@post.user)
  end
end
