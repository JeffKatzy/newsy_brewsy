class User < ActiveRecord::Base
  has_many :articles
  attr_accessible :name, :oauth_expires_at, :oauth_token, :provider, :uid
  attr_accessor :articles

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
       user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
  end

  def likes
    facebook.get_connections('me', 'likes')
  end

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

  def search(term)
    @results = {}
    ['name', 'work', 'education', 'interests', 'name', 'contact_email', 'current_location'].each do |field|
      result = facebook.fql_query('SELECT name, pic_square, uid FROM user WHERE uid in (SELECT uid2 FROM friend WHERE uid1=me()) and strpos(lower(' + field + '),' + ' "' + term + '") >= 0')
      @results[field] = result if result.present?
    end
    @results
  end

  def friends_by_location
    facebook.fql_query('SELECT name, current_location.city, pic_square, uid FROM user WHERE uid in (SELECT uid2 FROM friend WHERE uid1=me())').group_by{|u| u['current_location']}.reject!{ |k| k == nil }.sort_by{ |u| u[1].count }.reverse
  end

  def query(user_attr, field)
    facebook.fql_query('SELECT name, pic_square, uid FROM user WHERE uid in (SELECT uid2 FROM friend WHERE uid1=me()) and"' + user_attr  + '"in ' + field)
  end

end
