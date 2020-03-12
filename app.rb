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

	get '/bookmarks/new' do 
		erb :'bookmarks/new'
	end
	
	post '/bookmarks' do 
		Bookmark.create(url: params[:url], title: params[:title])
		# url = params['url']
		# connection = PG.connect(dbname:'bookmark_manager_test')
		# connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
		redirect '/bookmarks'
	end 

	run! if app_file == $0

end