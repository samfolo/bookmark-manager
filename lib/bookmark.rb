require 'pg'
require_relative 'database_connection'
require_relative 'validate'

class Bookmark
  attr_reader :title, :url

  def initialize(title, url)
    @title = title
    @url = url
  end

  def self.add_bookmark(title, url)
    return false unless Valid.url(url)

    DatabaseConnection.query "INSERT INTO bookmarks (title, url) VALUES ('#{title}', '#{url}')"
    true
  end

  def self.delete(title)
    DatabaseConnection.query "DELETE FROM bookmarks WHERE title = '#{title}'"
  end

  def self.update(target, new_title, new_url)
    target_bookmark = all.select { |bookmark| bookmark.title == target }.pop
    target_bookmark.update_title(new_title) unless new_title == ''
    target_bookmark.update_url(new_url) unless new_url == ''
  end

  def self.all
    rows = DatabaseConnection.query 'SELECT * FROM bookmarks'
    rows.reduce([]) { |arr, row| arr << Bookmark.new(row['title'], row['url']) }
  end

  def update_title(new_title)
    DatabaseConnection.query "UPDATE bookmarks SET title = '#{new_title}' WHERE title = '#{@title}'"
  end

  def update_url(new_url)
    DatabaseConnection.query "UPDATE bookmarks SET url = '#{new_url}' WHERE url = '#{@url}'"
  end
end
