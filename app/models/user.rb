require "sequel"
require "bcrypt"

class User < Sequel::Model(:user)
  attr_accessor :password_confirmation
  attr_reader :password

  def password=(password)
    @password = password
    self.password_hash = BCrypt::Password.create(password)
  end

  def authenticate(password)
    password_hash = BCrypt::Password.new(self.password_hash)
    password_hash == password
  end

  def validate
    super
    errors.add :password, "is not confirmed" if password != password_confirmation
  end
end
