class Watchlist < ActiveRecord::Base
  belongs_to :user
  has_many :stock_watchlists
  has_many :stocks, through: :stock_watchlists
end
