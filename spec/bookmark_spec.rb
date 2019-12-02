require 'bookmark'
require 'pg'

RSpec.describe Bookmark do
  let(:database) { double :database, exec: [{ 'id' => 1, 'url' => 'url_1' }, 
                                            { 'id' => 2, 'url' => 'url_2' },
                                            { 'id' => 3, 'url' => 'url_3' }]
  }
  let(:name) { 'Name' }
  let(:url) { 'URL' }
  subject(:bookmark) { Bookmark.new(name, url) }

  before(:each) do
    allow(PG).to receive(:connect).and_return database
  end

  it 'should have a name' do
    expect(subject).to have_attributes name: name
  end

  it 'should have a url' do
    expect(subject).to have_attributes url: url
  end

  describe '.all' do
    it 'should connect to the correct database' do
      user = ENV['USER']

      expect(PG).to receive(:connect).with({ dbname: 'bookmark_manager', user: user })
      Bookmark.all
    end

    it 'should return an array of bookmarks' do
      arr = []
      arr << Bookmark.new(1, 'url_1')
      arr << Bookmark.new(2, 'url_2')
      arr << Bookmark.new(3, 'url_3')

      expect(Bookmark.all).to eq arr
    end

    it 'should call #exec on database with an sql command' do
      expect(database).to receive(:exec).with('SELECT * FROM bookmarks')
      Bookmark.all
    end
  end
end
