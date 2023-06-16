class Admin::TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
    @posts = @tag.posts
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      @tags = Tag.all
      redirect_to admin_tags_path, notice: "タグを追加したよ"
    else
      render :index
    end
  end

  def destroy
    tag = Tag.find(params[:id])
    tag.destroy
    redirect_to request.referer
  end

  def search
    @tags = Tag.where("tag_name LIKE ?", "%#{params[:keyword]}%")
  end

  private

  def tag_params
    params.require(:tag).permit(:tag_name)
  end
end
