feature 'Delete Bookmark' do
  scenario 'Allows user to delete bookmark' do

    Bookmark.create(url: "http://www.makersacademy.com", title: "Makers")

    visit('/bookmarks')

    expect(page).to have_link("Makers", href: "http://www.makersacademy.com")
    click_button 'Delete Bookmark'
    expect(page).not_to have_link("Makers", href: "http://www.makersacademy.com")
  end
end
