require 'sinatra/base'
require './lib/bookmark'
class BookmarkManager < Sinatra::Base

	get '/' do 
		"Bookmark Manager"
	end 
	#1 User story: see the list of the book mark
	get '/bookmarks' do 
		@bookmarks = Bookmark.all
		erb :'bookmarks/index'
	end 

	run! if app_file == $0

end