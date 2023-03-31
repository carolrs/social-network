require_relative 'post_repository' 

describe PostRepository do 
  def reset_posts_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'social-network-test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_posts_table()
  end

  it "return a new post"do
    post_repo = PostRepository.new 
    post = Post.new 
    post.title = "Rainy day!"
    post.contents = "Its raining a lot today :("
    post.views = 2
    post_repo.create(post)
    result = post_repo.all[2]
    expect(result.title).to eq "Rainy day!"
    expect(result.contents).to eq "Its raining a lot today :("
  end

  it 'delete a post' do
    post_repo = PostRepository.new 
    post_repo.delete(1)
    result = post_repo.all.length
    expect(result).to eq 1

  end
end