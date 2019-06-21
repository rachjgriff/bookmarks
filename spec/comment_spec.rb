require 'comment'

describe Comment do
  describe '.create' do
    it 'Creates a new comment' do
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers")
      comment = Comment.create(text: 'test comment', bookmark_id: bookmark.id)
      persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM comments WHERE id = #{comment.id};")

      expect(comment.id).to eq persisted_data.first['id']
      expect(comment).to be_a Comment
      expect(comment.text).to eq 'test comment'
    end
  end

  describe '.where' do
    it 'Finds comments associated with bookmark id' do
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers")
      Comment.create(text: 'test comment', bookmark_id: bookmark.id)
      Comment.create(text: 'second test comment', bookmark_id: bookmark.id)

      comments = Comment.where(bookmark_id: bookmark.id)
      comment = comments.first
      persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM comments WHERE id = #{comment.id};")

      expect(comments.length).to eq 2
      expect(comment.id).to eq persisted_data.first['id']
      expect(comment.text).to eq 'test comment'
      expect(comment.bookmark_id).to eq bookmark.id

    end
  end
end
