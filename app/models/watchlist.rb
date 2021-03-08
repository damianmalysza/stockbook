class Watchlist < ActiveRecord::Base
  belongs_to :user
  has_many :stock_watchlists
  has_many :stocks, through: :stock_watchlists
  
  def watchlist_avg_change
    stock_count = self.stocks.length
    total_percent_change = 0
    
    if stock_count > 0
      self.stocks.each do |stock|
        change =+ stock.percent_change
      end
      (total_percent_change / stock_count).round(2)
    else
      0
    end 
    
  end
  
end
