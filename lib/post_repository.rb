require_relative 'post'

class PostRepository 

  def all
    sql = 'SELECT * FROM posts;'
    result_set = DatabaseConnection.exec_params(sql, [])

    posts = []

    result_set.each do |row|
      post = Post.new
      post.id = row['id']
      post.title = row['title']
      post.contents = row['contents']
      post.views = row['views']
      post.user_id = row['user_id']

      posts << post
    end
    posts
  end
  def create(post)
    sql = 'INSERT INTO posts(title, contents, views) VALUES ($1, $2, $3)'
    DatabaseConnection.exec_params(sql, [post.title, post.contents, post.views])

  end
  def delete(id)
    sql = 'DELETE from posts WHERE id = $1'
    DatabaseConnection.exec_params(sql, [id])

  end
end