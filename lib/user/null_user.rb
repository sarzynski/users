class NullUser
  def first_name
    'N/A'
  end

  def last_name
    'N/A'
  end

  def email
    'N/A'
  end

  def method_missing(*args, &block)
    'Error'
  end
end