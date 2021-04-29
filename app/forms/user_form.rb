class UserForm
  include ActiveModel::Model
  include ActiveRecord::AttributeAssignment

  attr_accessor :first_name, :last_name, :email, :birth_date

  validates_presence_of :first_name, :last_name, :email, :birth_date

  def save
    if valid?
      user = User.new(first_name: first_name, last_name: last_name, email: email, birth_date: birth_date)
      user.save
    else
      false
    end
  end
end
