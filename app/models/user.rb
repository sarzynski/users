class User < ApplicationRecord
  def self.birthday_user
    User.where('EXTRACT(month FROM birth_date) = ? AND EXTRACT(day FROM birth_date) = ?', Date.today.strftime('%m'),
               Date.today.strftime('%d')).take || NullUser.new
  end
end
