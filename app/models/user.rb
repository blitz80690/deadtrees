require "sequel"
require "bcrypt"

class User < Sequel::Model(:user)
  def password=(password)
    self.password_hash = BCrypt::Password.create(password)
  end

  def authenticate(password)
    password_hash = BCrypt::Password.new(self.password_hash)
    password_hash == password
  end
end
