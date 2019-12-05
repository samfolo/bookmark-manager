require 'pg'

class Bookmark
  attr_reader :title, :url

  def initialize(title, url)
    @title = title
    @url = url
  end

  def self.add_bookmark(title, url)
    CONNECTION.exec "INSERT INTO bookmarks (title, url) VALUES ('#{title}', '#{url}')"
  end

  def self.delete(title)
    CONNECTION.exec "DELETE FROM bookmarks WHERE title = '#{title}'"
  end

  def self.update(target, new_title, new_url)
    target_bookmark = all.select { |bookmark| bookmark.title == target }.pop
    target_bookmark.update_title(new_title) unless new_title == ''
    target_bookmark.update_url(new_url) unless new_url == ''
  end

  def self.all
    rows = CONNECTION.exec 'SELECT * FROM bookmarks'
    rows.reduce([]) { |arr, row| arr << Bookmark.new(row['title'], row['url']) }
  end

  def self.dbname
    ENV['ENVIRONMENT'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
  end

  CONNECTION = PG.connect dbname: dbname, user: ENV['USER']

  def update_title(new_title)
    CONNECTION.exec "UPDATE bookmarks SET title = '#{new_title}' WHERE title = '#{@title}'"
  end

  def update_url(new_url)
    CONNECTION.exec "UPDATE bookmarks SET url = '#{new_url}' WHERE url = '#{@url}'"
  end
end
