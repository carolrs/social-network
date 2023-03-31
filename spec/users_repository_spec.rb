require 'user_repository'

describe UserRepository do
  def reset_users_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'social-network-test' })
    connection.exec(seed_sql)
  end
  before(:each) do
    reset_users_table()
  end

  it "return users" do 
    repo = UserRepository.new
    users = repo.all 

    result = User.new('anne@gmail.com', 'anne_smith')
    expect(users.first.user_email).to eq 'anne@gmail.com'
    expect(users.first.username).to eq 'anne_smith'

  end

end