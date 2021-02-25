class Portfolio < ActiveRecord::Base
  belongs_to :user
  has_many :stock_portfolios
  has_many :stocks, through: :stock_portfolios
end
