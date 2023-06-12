class Public::BookmarksController < ApplicationController
  
  def index
    @bookmarks = current_user.bookmarks
  end

  def create
    @bookmark = current_user.bookmarks.build(bookmark_params)
    if @bookmark.save
      redirect_to bookmarks_path, notice: 'ブックマークが追加されました。'
    else
      redirect_to bookmarks_path, alert: 'ブックマークの追加に失敗しました。'
    end
  end

  def update
    if @bookmark.update(bookmark_params)
      redirect_to bookmarks_path, notice: 'ブックマークが更新されました。'
    else
      redirect_to bookmarks_path, alert: 'ブックマークの更新に失敗しました。'
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to bookmarks_path, notice: 'ブックマークが削除されました。'
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:title, :url)
  end
end
