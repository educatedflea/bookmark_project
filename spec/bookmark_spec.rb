require 'bookmark'

describe Bookmark do 
	describe '.all' do 
		it 'returns all the bookmark' do 
			connection = PG.connect(dbname: 'bookmark_manager_test')
			# add tests data
			connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
			connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
			connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
			# test the data we just added above 
			bookmarks = Bookmark.all
			expect(bookmarks).to include "http://www.makersacademy.com"
			expect(bookmarks).to include "http://www.destroyallsoftware.com"
			expect(bookmarks).to include "http://www.google.com"
		end 
	end 
end 