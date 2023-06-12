class SearchController < ApplicationController
  def search
    @range = params[:range]
    @word = params[:word]

    if @range == "ユーザー"
    @users = User.looks(@word)
    render "/searches/search"
    else
    @posts = Post.looks(@word)
    render "/searches/search"
    end
  end
end
