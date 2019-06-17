feature 'Viewing index' do
  scenario 'Viewing the index page' do
    visit('/')

    expect(page).to have_content 'Bookmark Manager'
  end
end
