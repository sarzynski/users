class NewUsersQuery
  def initialize(users = User.all)
    @users = users
  end

  def new_users
    @users.where("created_at >= ?", 1.week.ago.utc)
  end
end