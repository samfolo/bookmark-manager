require 'bookmark'
require 'pg'

RSpec.describe Bookmark do
  let(:connection) { PG.connect db_info }
  let(:test_list) { described_class.all }
  let(:db_info) { { dbname: 'bookmark_manager_test', user: ENV['USER'] } }
  let(:test_bookmark) { Bookmark.new('MySite', 'https://mysite.gov') }
  
  it 'has a name' do
    expect(test_bookmark.title).to eq 'MySite'
  end

  it 'has a URL' do
    expect(test_bookmark.url).to eq 'https://mysite.gov'
  end

  context '.add_bookmark' do
    it 'returns twitter and makers academy when both sites are added to bookmarks' do
      Bookmark.add_bookmark('Twitter', 'https://twitter.com')
      Bookmark.add_bookmark('Reddit', 'https://reddit.com')

      urls = test_list.map { |bookmark| bookmark.url }

      expect(urls).to include 'https://twitter.com'
      expect(urls).to include 'https://reddit.com'
    end

    it 'returns twitter and google when both sites are added to bookmarks' do
      Bookmark.add_bookmark('YouTube', 'https://youtube.com')
      Bookmark.add_bookmark('Twitter', 'https://twitter.com')

      urls = test_list.map { |bookmark| bookmark.url }

      expect(urls).to include 'https://youtube.com'
      expect(urls).to include 'https://twitter.com'
    end

    it 'prevents invalid urls from being added to the database' do
      Bookmark.add_bookmark('YouTube', 'https:///youtube.. .com')

      urls = test_list.map { |bookmark| bookmark.title }

      expect(urls).not_to include 'YouTube'
    end
  end

  describe '.delete' do
    before(:each) do
      Bookmark.add_bookmark('YouTube', 'https://youtube.com')
      Bookmark.add_bookmark('Twitter', 'https://twitter.com')
      Bookmark.add_bookmark('Reddit', 'https://reddit.com')
    end

    it 'removes an entry from the list of bookmarks' do
      Bookmark.delete('YouTube')
      
      urls = test_list.map { |bookmark| bookmark.url }

      expect(urls).not_to include 'https://youtube.com'
    end
  end

  describe '.update' do
    before(:each) do
      Bookmark.add_bookmark('YouTube', 'https://youtube.com')
      Bookmark.add_bookmark('Twitter', 'https://twitter.com')
      Bookmark.add_bookmark('Reddit', 'https://reddit.com')
    end

    it 'update the information for an existing URL' do
      Bookmark.update('YouTube', '', 'https://yewtoob.com')

      urls = test_list.map { |bookmark| bookmark.url }

      expect(urls).to include 'https://yewtoob.com'
    end
  end
end
