feature 'Adding a new bookmark' do
  scenario 'User adds bookmark from the to Bookmark Manager' do
    visit('/bookmarks/new')


    fill_in 'url', with: "http://www.makersacademy.com"
    fill_in 'title', with: "Makers"
    click_button 'Save Bookmark'
    expect(page).to have_link("Makers", href: "http://www.makersacademy.com")
  end
end
