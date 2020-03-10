feature "Viewing bookmarks" do
	scenario 'visiting hamepage' do 
		visit '/'
		expect(page).to have_content 'Bookmark Manager'
	end 

	scenario 'A user can see bookmarks' do 
		Bookmark.create(url:"http://www.makersacademy.com")
		Bookmark.create(url:"http://www.destroyallsoftware.com")
		Bookmark.create(url: "http://www.google.com")
		# connection  = PG.connect(dbname: 'bookmark_manager_test')
		# #add test data 
		# connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    # connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
		# connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")
		
		#now test the test data just added
		visit '/bookmarks'
		expect(page).to have_content "http://www.makersacademy.com"
		expect(page).to have_content "http://www.destroyallsoftware.com"
		expect(page).to have_content "http://www.google.com"
	end  
end 