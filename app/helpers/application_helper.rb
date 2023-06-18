module ApplicationHelper
  include Rails.application.routes.url_helpers
  
  def how_long_ago(time)
    time_ago_in_words(time) + "前"
  end
end
