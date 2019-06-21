feature 'ability to add comment to existing bookmark' do
  scenario 'adds a comment to a bookmark' do
    Bookmark.create(url: "http://www.makersacademy.com", title: "Makers")

    visit '/bookmarks'

    expect(page).to have_link("Makers", href: "http://www.makersacademy.com")
    click_button 'Comment'
    fill_in 'text', with: 'test comment'
    click_button 'Add'
    expect(page).to have_content 'test comment'
  end
end
