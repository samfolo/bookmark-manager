require_relative '../../lib/database_connection'

def refresh_database
  DatabaseConnection.setup ENV['USER']
  DatabaseConnection.query 'TRUNCATE bookmarks'
end

def establish_connection
  DatabaseConnection.setup ENV['USER']
end
