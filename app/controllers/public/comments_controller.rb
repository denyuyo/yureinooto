class Public::CommentsController < ApplicationController

  def index
    @user = User.find(params[:id])
    @comments = Comment.where(user_id: @user.id)
  end
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to post_path(@post), notice: "コメントを送信しました"
    else
      flash.now[:alert] = "コメントの送信に失敗しました"
      render 'public/posts/show'
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
