class Public::Search::TagController < ApplicationController
  
  def index
    # 検索タグを取得
    tag = params[:query]
    
    # 検索ロジックを実行
    @results = perform_tag_search(tag)
  end

  private

  def perform_tag_search(tag)
    # 検索ロジックの実装
    # 例えば、Postモデルのタグから検索する場合
    Post.tagged_with(tag)
  end
  
end
