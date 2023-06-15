class Admin::CommentsController < ApplicationController
  
  def index
    @user = User.find(params[:id])
    @comment = Postcomment.where(user_id: @user.id)
  end
end