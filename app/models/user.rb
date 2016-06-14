class User < ActiveRecord::Base
  include ActiveModel::SecurePassword
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
end
