class Stock < ActiveRecord::Base
  has_many :stock_portfolios
  has_many :portfolios, through: :stock_portfolios
end
