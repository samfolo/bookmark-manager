require 'bookmark'

RSpec.describe Bookmark do
  let(:name) { 'Name' }
  let(:url) { 'URL' }
  subject(:bookmark) { Bookmark.new(name, url) }

  it 'should have a name' do
    expect(subject).to have_attributes name: name
  end

  it 'should have a url' do
    expect(subject).to have_attributes url: url
  end

  describe '.all' do
    it 'should return an array of bookmarks' do
      arr = []
      arr << Bookmark.new('Google', 'https://google.com')
      arr << Bookmark.new('Reddit', 'https://reddit.com')
      arr << Bookmark.new('YouTube', 'https://youtube.com')
      arr << Bookmark.new('BBC News', 'https://bbc.co.uk/news')
      arr << Bookmark.new('Cincinnati Zoo', 'http://cincinnatizoo.org')

      expect(Bookmark.all).to eq arr
    end
  end
end
