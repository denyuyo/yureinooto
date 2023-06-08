class Public::Search::UserController < ApplicationController
  
  def index
    # 検索ユーザー名を取得
    username = params[:query]
    
    # 検索ロジックを実行
    @results = perform_user_search(username)
  end

  private

  def perform_user_search(username)
    # 検索ロジックの実装
    # 例えば、Userモデルの名前から検索する場合
    User.where("name LIKE ?", "%#{username}%")
  end
  
end
