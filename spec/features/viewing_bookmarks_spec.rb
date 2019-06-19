feature 'Viewing bookmarks' do
  scenario 'Visiting the bookmark page' do

    Bookmark.create("Makers", "http://www.makersacademy.com")
    Bookmark.create("Software", "http://www.destroyallsoftware.com")
    Bookmark.create("Google", "http://www.google.com")

    visit('/bookmarks')

    bookmarks = Bookmark.all

    expect(page).to have_content("Makers")
    expect(page).to have_content("Software")
    expect(page).to have_content("Google")
  end
end
