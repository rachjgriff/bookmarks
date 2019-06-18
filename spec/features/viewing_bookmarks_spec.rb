feature 'Viewing bookmarks' do
  scenario 'Visiting the bookmark page' do
    visit('/bookmarks')

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content("http://www.askjeeves.com")
  end
end
