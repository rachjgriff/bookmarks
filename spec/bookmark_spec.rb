require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'Returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers")
      Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Software")
      Bookmark.create(url: "http://www.google.com", title: "Google")

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
      expect(bookmarks.first.title).to eq 'Makers'
    end
  end

  describe '.create' do
    it ' Creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')
      persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.url).to eq 'http://www.makersacademy.com'
      expect(bookmark.title).to eq 'Makers'
    end
  end

  describe '.delete' do
    it 'Deletes a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')
      Bookmark.delete(id: bookmark.id)
      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 0
    end
  end

  describe '.find' do
    it 'retrieves a bookmark from the database' do
      bookmark_in = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')
      bookmark = Bookmark.find(id: bookmark_in.id)
      expect(bookmark.id).to eq bookmark_in.id
    end
  end

  describe '.update' do
    it 'updates existing bookmark' do
      bookmark_in = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')
      bookmark = Bookmark.find(id: bookmark_in.id)
      Bookmark.update(id: bookmark.id, url: 'http://www.google.com', title: 'Google')
      bookmark = Bookmark.find(id: bookmark_in.id)
      expect(bookmark.title).to eq 'Google'
    end
  end
end
