def refresh_database
  PG.connect dbname: 'bookmark_manager_test', user: ENV['USER']
  connection.exec 'TRUNCATE bookmarks'
end