require 'pg'

class Bookmark
  attr_reader :name, :url

  CONNECTION = PG.connect dbname: 'bookmark_manager', user: ENV['USER']

  def initialize(name, url)
    @name = name
    @url = url
  end

  def self.add_bookmark(name, url)
    CONNECTION.exec "INSERT INTO bookmarks (name, url) VALUES ('#{name}', '#{url}')"
  end

  def self.all
    rows = CONNECTION.exec 'SELECT * FROM bookmarks'
    rows.reduce([]) { |arr, row| arr << Bookmark.new(row['name'], row['url']) }
  end
end
