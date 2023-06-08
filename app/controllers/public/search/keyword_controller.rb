class Public::Search::KeywordController < ApplicationController
  
  def index
    # 検索キーワードを取得
    keyword = params[:query]
    
    # 検索ロジックを実行
    @results = perform_keyword_search(keyword)
  end

  private

  def perform_keyword_search(keyword)
    # 検索ロジックの実装
    # 例えば、Postモデルのタイトルや本文からキーワードで検索する場合
    Post.where("title LIKE ? OR content LIKE ?", "%#{keyword}%", "%#{keyword}%")
  end
  
end
