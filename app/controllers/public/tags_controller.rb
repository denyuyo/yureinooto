class Public::TagsController < ApplicationController
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
      redirect_to tags_path, notice: "タグを追加したよ"
    else
      render :index
    end
  end
  
  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to tags_path, notice: "タグを更新しました"
    else
      render :index
    end
  end
  
  def search
    @tags = Tag.where("tag_name LIKE ?", "%#{params[:keyword]}%")
  end

  private

  def tag_params
    params.require(:tag).permit(:tag_name)
  end
end
