class Tag < ActiveRecord::Base
  has_many :users
  has_many :articles
  attr_accessible :name
end
