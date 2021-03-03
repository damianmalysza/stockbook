class User < ActiveRecord::Base
  has_secure_password

  has_many :watchlists 
  has_many :stocks, through: :watchlists
end
