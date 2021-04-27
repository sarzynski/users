class User < ApplicationRecord
  def self.birthday_user
    find_by(birth_date: Date.today) || NullUser.new
  end
end
