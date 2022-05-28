class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: {minimum: 6}, allow_nil: true

  def token
    JWT.encode({user_id: self.id}, ENV['SECRET_KEY_BASE'] || 'payload')
  end
  
  def name
    "#{self.first_name} #{self.last_name}"
  end

end
