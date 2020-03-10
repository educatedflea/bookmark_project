require 'pg' 

class Bookmark
	def self.all 
		#connect to pg database
		connection = PG.connect(dbname:'bookmark_manager')
		# run querys on connected database, assign query returns to a variable 
		result = connection.exec("SELECT * FROM bookmarks;")
		# map the returns to the variable i.e, allow the return values to update the variable 
		result.map {|bookmark| bookmark['url']}
	end 
end 