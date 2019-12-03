require 'bookmark'
require 'pg'

RSpec.describe Bookmark do
  let(:test_list) { described_class }

  before(:each) do
    test_list.add_bookmark('Google', 'https://google.com')
    test_list.add_bookmark('Twitter', 'https://twitter.com')
    test_list.add_bookmark('Makers Academy', 'https://makersacademy.com')
  end
  
  it 'contains a list of bookmarks' do
    expect(test_list.all).to eq [
      { name: 'Google', url: 'https://google.com' }, 
      { name: 'Twitter', url: 'https://twitter.com' },
      { name: 'Makers Academy', url: 'https://makersacademy.com' }
    ]
  end
end