class User < ActiveRecord::Base
  has_secure_password

  has_one :portfolio 
  has_many :stocks, through: :portfolio
end
