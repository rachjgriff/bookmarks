require 'pg'
require_relative 'database_connection'

class Bookmark

  attr_reader :id,  :url, :title

  def initialize(id:, url:, title:)
    @id = id
    @title = title
    @url = url
  end

  def comments(comment = Comment)
    comment.where(bookmark_id: @id)
  end

  def self.all
    bookmarks = DatabaseConnection.query('SELECT * FROM bookmarks;')
    bookmarks.map do |bookmark|
      Bookmark.new(id: bookmark['id'], url: bookmark['url'], title: bookmark['title'])
    end
  end

  def self.create(url:, title:)
  #  return false unless is_url?(url)
    result = DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}') RETURNING id, url, title;")
    Bookmark.new(id: result[0]['id'], url: result[0]['url'], title: result[0]['title'])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM comments WHERE bookmark_id='#{id}';")
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id='#{id}';")
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id='#{id}';")
    Bookmark.new(id: result[0]['id'], url: result[0]['url'], title: result[0]['title'])
  end

  def self.update(id:, url:, title:)
    DatabaseConnection.query("UPDATE bookmarks SET url='#{url}', title='#{title}' WHERE id='#{id}';")
  end
end
