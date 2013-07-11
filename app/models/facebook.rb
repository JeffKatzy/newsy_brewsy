class Facebook < Service

	attr_accessible :oauth_token

	def login
		@facebook ||= Koala::Facebook::API.new(oauth_token)
	end

	def get_interests(user)
		facebook.get_connections(user, 'likes')
	end

	def search(tag)
		@results = {}
		fields = ['name', 'work', 'education', 'interests', 'contact_email', 'current_location']
		fb_query = "SELECT name, pic_square, uid FROM user WHERE uid in (SELECT uid2 FROM friend WHERE uid1=me()) and strpos(lower(#{fields}), #{tag}) >= 0"
		fields.each do |field|
			  result = facebook.fql_query(fb_query)
			  @results[field] = result if result.present?
		end
		@results
	end

	def friends_by_location
		fb_query = 'SELECT name, current_location.city, pic_square, uid FROM user WHERE uid in (SELECT uid2 FROM friend WHERE uid1=me())'
		how_to_group = 'current_location'
		facebook.fql_query(fb_query).group_by{|u| u[how_to_group]}.reject!{ |k| k == nil }.sort_by{ |u| u[1].count }.reverse
	end

	def query(user_attr, field)
		fb_query = "SELECT name, pic_square, uid FROM user WHERE uid in (SELECT uid2 FROM friend WHERE uid1=me()) and #{user_attr} in #{field}"
		facebook.fql_query(fb_query)
	end

end