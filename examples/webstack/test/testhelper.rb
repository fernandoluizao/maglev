module TestHelper

  # Create a new user (error if already exists)
  def create_and_save(user, pw)
    u = User.signup(user, pw)
    u.save
    u
  end

  # Create new user, deleting old one if it exists
  def ensure_user_exists(name, pw='pw')
    user = User.find_by_name(name)
    user.delete unless user.nil?
    user = User.new name, pw
    user.save
    user
  end

  # Deletes user named +name+, if it exists
  def ensure_no_user_named(name)
    user = User.find_by_name(name)
    user.delete if user
  end

  module_function :create_and_save, :ensure_no_user_named, :ensure_user_exists
end
