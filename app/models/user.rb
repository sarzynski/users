class User < ApplicationRecord
  def self.best_user
    find_by(last_name: 'best') || NullUser.new
  end
end
