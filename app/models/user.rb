require 'BCrypt'

class User < ActiveRecord::Base
  # Remember to create a migration!
  include BCrypt
  has_many :votes
  has_many :answers
  has_many :questions
  has_many :comments
  
  def authenticate(password_attempt)
  	self.password == password_attempt
  end

  def password
  	@password ||= Password.new(hashed_password)
  end

  def password=(new_password)
  	@password = Password.create(new_password)
  	self.hashed_password = @password
  end
end
