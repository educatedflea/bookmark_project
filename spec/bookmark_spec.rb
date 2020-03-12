require 'bookmark'

describe Bookmark do 
	describe '.all' do 
		it 'returns all the bookmark' do 
			# add tests data
			Bookmark.create(url:"http://www.makersacademy.com",title: 'Makers')
			Bookmark.create(url:"http://www.destroyallsoftware.com",title: 'Destroyer')
			Bookmark.create(url: "http://www.google.com",title: 'Google')

			bookmarks = Bookmark.all
			expect(bookmarks).to include "http://www.makersacademy.com"
			expect(bookmarks).to include "http://www.destroyallsoftware.com"
			expect(bookmarks).to include "http://www.google.com"
		end 
	end 

	describe '.create' do 
		it 'create a new bookmark' do 
			bookmark = Bookmark.create(url: 'http://testbookmark.com', title: 'Test Bookmark').first

			expect(bookmark['url']).to eq 'http://testbookmark.com'
			expect(bookmark['title']).to eq 'Test Bookmark'
		end 
	end 
end 