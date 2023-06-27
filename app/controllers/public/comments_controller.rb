class Public::CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.content.blank?
      redirect_to post_path(@post), alert: "コメントの内容を入力してください"
    elsif @comment.save
      # コメントが保存された後に通知を作成・送信
      @post.create_notification_comment!(current_user, @comment)
      redirect_to post_path(@post), notice: "コメントを送信しました"
    else
      flash.now[:alert] = "コメントの送信に失敗しました"
      render 'public/posts/show'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    
    puts "コメントのID: #{@comment.id}"
    puts "現在のユーザーID: #{current_user.id}"
    
    if @comment.user_id == current_user.id
      @comment.destroy
      redirect_to request.referer, notice: "コメントを削除しました"
    else
      redirect_to request.referer
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
