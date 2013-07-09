class Article < ActiveRecord::Base
  has_many :tags
  has_many :users, through: :tags
  attr_accessible :tag_id, :text_preview, :title, :url, :user_id

  def generate_tags
    text_preview
  end
end
