class Bookmark
  attr_reader :name, :url

  def initialize(name, url)
    @name = name
    @url = url
  end

  def self.all
    [
      new('Google', 'https://google.com'), 
      new('Reddit', 'https://reddit.com'), 
      new('YouTube', 'https://youtube.com'), 
      new('BBC News', 'https://bbc.co.uk/news'), 
      new('Cincinnati Zoo', 'http://cincinnatizoo.org')
    ]
  end

  def == other
    name == other.name && url == other.url
  end
end
