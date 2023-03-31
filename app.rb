# file: app.rb

require_relative 'lib/database_connection'
require_relative 'lib/post_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('social-network')

# Perform a SQL query on the database and get the result set.
sql = 'SELECT * FROM posts;'
result = DatabaseConnection.exec_params(sql, [])

post_repo = PostRepository.new

# Print out each record from the result set .
post_repo.all.each do |post|
puts "Post: #{post.title}: #{post.contents}  - Views #{post.views}: User_id:  #{post.user_id}"
end