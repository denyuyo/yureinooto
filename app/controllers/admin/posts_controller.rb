class Admin::PostsController < ApplicationController
  
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comments = @post.comments.all
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.delete
    redirect_to admin_user_path(@post.user)
  end
end
