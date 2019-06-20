feature 'Updating bookmark' do
  scenario 'User can update existing bookmark' do
    Bookmark.create(url: "http://www.makersacademy.com", title: "Makers")

    visit '/bookmarks'

    expect(page).to have_link("Makers", href: "http://www.makersacademy.com")
    click_button 'Update'
    fill_in 'url', with: 'http://www.google.com'
    fill_in 'title', with: 'Google'
    click_button 'Update'
    expect(page).not_to have_link("Makers", href: "http://www.makersacademy.com")
    expect(page).to have_link("Google", href: "http://www.google.com")
  end
end
