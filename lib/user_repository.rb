require 'user'

class UserRepository
  def all
    sql = 'SELECT * FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])

    users = []

    result_set.each do |row|
      user = User.new
      user.id = row['id']
      user.user_email = row['user_email']
      user.username = row['username']

      users << user
    end
    users
  end
end