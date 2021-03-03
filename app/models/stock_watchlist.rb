class StockWatchlist < ActiveRecord::Base
  belongs_to :stock 
  belongs_to :watchlist
end
