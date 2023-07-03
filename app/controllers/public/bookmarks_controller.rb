class Public::BookmarksController < ApplicationController
  def create
    @post_bookmark = Bookmark.new(user_id: current_user.id, post_id: params[:post_id])
    @post_bookmark.save
  
    # 通知の作成と送信
    post = Post.find(params[:post_id])
    unless current_user == post.user
      post.create_notification_bookmark!(current_user)
    end
  
    redirect_to request.referer
  end

  def destroy
    @post = Post.find(params[:post_id])
    @bookmark = current_user.bookmarks.find_by(post_id: @post.id)
    @bookmark.destroy
    redirect_to request.referer
  end

  def index
    @user = User.find(params[:id])
    @bookmarks = Bookmark.where(user_id: @user.id)
    @posts = Post.where(id: @bookmarks.pluck(:post_id))
  end
end
