class Public::CommentsController < ApplicationController
  
  before_action :set_post, only: [:new, :create]
  before_action :set_comment, only: [:destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.build(comment_params)
    if @comment.save
      redirect_to post_path(@post), notice: 'コメントが投稿されました。'
    else
      redirect_to post_path(@post), alert: 'コメントの投稿に失敗しました。'
    end
  end

  def index
    @comments = Comment.all
  end

  def destroy
    @comment.destroy
    redirect_to comments_path, notice: 'コメントが削除されました。'
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
