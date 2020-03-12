feature "Viewing bookmarks" do
	scenario 'visiting hamepage' do 
		visit '/'
		expect(page).to have_content 'Bookmark Manager'
	end 

	scenario 'A user can see bookmarks' do 
		Bookmark.create(url:"http://www.makersacademy.com", title: 'Makers')
		Bookmark.create(url:"http://www.destroyallsoftware.com", title: 'Destroyer')
		Bookmark.create(url: "http://www.google.com", title: 'Google')
		#added test data 
		
		#now test the test data just added
		visit '/bookmarks'
		expect(page).to have_link('Makers', href:"http://www.makersacademy.com")
		expect(page).to have_link('Destroyer',href:"http://www.destroyallsoftware.com")
		expect(page).to have_link('Google',href:"http://www.google.com")
	end  
end 