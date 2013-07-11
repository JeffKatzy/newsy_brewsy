class HomeController < ApplicationController
  layout 'home'
  def index
  end

  def news
  	interests = @current_user.get_interests
  	ArticleManager.generate_articles_from(interests)
  end
end