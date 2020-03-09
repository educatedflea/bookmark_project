feature "Viewing bookmarks" do
	scenario 'visiting hamepage' do 
		visit '/'
		expect(page).to have_content 'Bookmark Manager'
	end 
end 