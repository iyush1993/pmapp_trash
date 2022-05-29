class User < ApplicationRecord
  has_secure_password
  has_many :projects
  validates :email, presence: true, uniqueness: { case_sensitive: true }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: {minimum: 6}, allow_nil: true

  def token
    JWT.encode({user_id: self.id}, ENV['SECRET_KEY_BASE'] || 'yourSecret')
  end
  
  def name
    "#{self.first_name} #{self.last_name}"
  end

end
