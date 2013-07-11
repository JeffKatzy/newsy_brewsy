class User < ActiveRecord::Base
  has_many :articles
  attr_accessible :name, :oauth_expires_at, :oauth_token, :provider, :uid, :service
  attr_accessor :articles, :service

  def initialize(service = Facebook.new)
    @service = service
  end

  def login
    @service.login
  end

  def contacts
    @service.get_contacts
  end

  def interests
    @service.get_interests
  end

  def self.create_or_find(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
       user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  #MODIFY LATER

  def retrieve_articles
    @articles = {}
    likes.each do |like|
      @articles[like['name']] = ZemantaClient.generate_articles_from(like['name'])
    end
    @articles
  end

  def generate_news
    @articles[like['name']].each do |article|
      article = Article.create(title: article['title'], url: article['url'], text_preview: article['text_preview'], user_id: self.id)
      article.generate_tags
    end
    @articles
  end
end
