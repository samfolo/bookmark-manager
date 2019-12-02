require 'sinatra/base'
require_relative 'bookmark'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Bookmark Manager'
  end
  
  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end
end
