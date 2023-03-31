class User 
  attr_accessor :id, :user_email, :username

  def initialize(id = nil, user_email = nil, username = nil)
    @id = id 
    @user_email = user_email 
    @username =  username

  end
end