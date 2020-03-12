require 'pg' 

class Bookmark
	attr_reader :id, :title, :url

	def initialize(id:, title:, url:)
		@id = id
		@title = title
		@url = url
	end 

	def self.all 
		if ENV['ENVIRONMENT'] == 'test'
			connection = PG.connect(dbname:'bookmark_manager_test')
		else 
		#connect to pg database
			connection = PG.connect(dbname:'bookmark_manager')
		end 

		# run querys on connected database, assign query returns to a variable 
		result = connection.exec("SELECT * FROM bookmarks;")
		# map the returns to the variable i.e, allow the return values to update the variable 
		result.map do |bookmark| bookmark['url']
			Bookmark.new(id: bookmark['id'], title: bookmark['title'], url:bookmark['url'])
		end 
	end 

	def self.create(url:, title:)
		return false unless true #is_url(url)
		if ENV['ENVIRONMENT'] == 'test'
			connection = PG.connect(dbname: 'bookmark_manager_test')
		else 
			connection = PG.connect(dbname: 'bookmark_manager')
		end 
		
		result = connection.exec("INSERT INTO bookmarks (title, url) VALUES('#{title}','#{url}') RETURNING id, url, title")
		Bookmark.new(id: result[0]["id"], title: result[0]['title'], url: result[0]['url'])
	end 
end 