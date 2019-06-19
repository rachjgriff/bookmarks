feature 'Adding bookmark' do
  scenario 'User adds bookmark from the browser' do
    visit('/bookmarks')

    fill_in 'Bookmark', with: "http://www.makersacademy.com"
    click_button 'Save Bookmark'
    expect(page).to have_content "http://www.makersacademy.com"
  end
end
