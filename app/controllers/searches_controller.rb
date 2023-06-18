class SearchesController < ApplicationController
  def search
    @range = params[:range]
    @word = params[:word].strip # 入力文字列の前後の空白を削除
  
    if @word.blank?
      flash[:alert] = "検索キーワードを入力してください"
      redirect_back(fallback_location: root_path)
      return
    end
  
    case @range
    when "ユーザー"
      @users = User.where("name LIKE ?", "%#{@word}%")
    when "つぶやき"
      @posts = Post.where("title LIKE ?", "%#{@word}%")
    when "タグ"
      @tags = Tag.where("tag_name LIKE ?", "%#{@word}%")
    end
  end
end
