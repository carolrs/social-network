class Post 
  attr_accessor :id, :title, :contents, :views, :user_id

  def initialize(id = nil, title= nil, contents= nil, views= nil, user_id= nil)
    @id = id 
    @title = title 
    @contents = contents 
    @views = views 
    @user_id = user_id

  end
end