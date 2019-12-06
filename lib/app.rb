require 'pg'
require 'rspec'
require 'sinatra/base'
require_relative 'bookmark'
require_relative 'database_connection'

class BookmarkManager < Sinatra::Base
  enable :sessions

  before do
    DatabaseConnection.setup ENV['USER']
    @selection = params.keys.pop
  end

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @valid_entry = session[:valid] == true
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  post '/bookmarks' do
    session[:valid] = Bookmark.add_bookmark(params['title'], params['url'])
    redirect '/bookmarks'
  end

  post '/delete' do
    Bookmark.delete(@selection)
    redirect '/bookmarks'
  end

  post '/update' do
    erb :update
  end

  post '/handle-update' do
    Bookmark.update(@selection, params['title'], params['url'])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
