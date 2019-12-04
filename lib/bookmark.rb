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

  def self.all
    rows = CONNECTION.exec 'SELECT * FROM bookmarks'
    rows.reduce([]) { |arr, row| arr << Bookmark.new(row['title'], row['url']) }
  end

  def self.dbname
    ENV['ENVIRONMENT'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
  end

  CONNECTION = PG.connect dbname: dbname, user: ENV['USER']
end
