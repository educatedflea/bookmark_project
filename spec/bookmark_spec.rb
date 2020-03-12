require 'bookmark'
require 'database_helper'

describe Bookmark do 
	describe '.all' do 
		it 'returns all the bookmark' do 
			connection = PG.connect(dbname:'bookmark_manager_test')
			# add tests data
			bookmark = Bookmark.create(url:"http://www.makersacademy.com",title: 'Makers')
			Bookmark.create(url:"http://www.destroyallsoftware.com",title: 'Destroyer')
			Bookmark.create(url: "http://www.google.com",title: 'Google')

			bookmarks = Bookmark.all
			expect(bookmarks.length).to eq 3
			expect(bookmarks.first).to be_a Bookmark
			expect(bookmarks.first.id).to eq bookmark.id
			expect(bookmarks.first.title).to eq 'Makers'
			expect(bookmark.url).to eq "http://www.makersacademy.com"
		end 
	end 


	describe '.create' do 
		it 'create a new bookmark' do 
			bookmark = Bookmark.create(url: 'http://testbookmark.com', title: 'Test Bookmark')
			persisted_data = persisted_data(id: bookmark.id)

			expect(bookmark).to be_a Bookmark
			expect(bookmark.id).to eq persisted_data.first['id']
			expect(bookmark.title).to eq 'Test Bookmark'
			expect(bookmark.url).to eq 'http://testbookmark.com'
		end 
	end 

	describe '.delete' do 
		it 'deletes the given bookmark' do 
			bookmark = Bookmark.create(title: 'Maker', url:'http://www.makersacademy.com')

			Bookmark.delete(id: bookmark.id)
			expect(Bookmark.all.length).to eq 0 
		end 
	end 
end 