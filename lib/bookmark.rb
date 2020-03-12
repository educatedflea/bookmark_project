require 'pg' 

class Bookmark
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
		result.map {|bookmark| bookmark['url']}
	end 

	def self.create(url:, title:)
		if ENV['ENVIRONMENT'] == 'test'
			connection = PG.connect(dbname: 'bookmark_manager_test')
		else 
			connection = PG.connect(dbname: 'bookmark_manager')
		end 
		connection.exec("INSERT INTO bookmarks (title, url) VALUES('#{title}','#{url}') RETURNING id, url, title")
	end 
end 