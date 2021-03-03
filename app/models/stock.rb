class Stock < ActiveRecord::Base
  has_many :stock_watchlists
  has_many :watchlists, through: :stock_watchlists

  include HTTParty

  @@api_key = YAML.load_file('./api_key.yml')["api_key"]

  base_uri "https://cloud.iexapis.com/stable/tops?token=#{@@api_key}&"

  def self.get_stock_info(ticker)
    get("symbols=#{ticker}")
  end
  
  def self.valid_ticker?(ticker)
    !get_stock_info(ticker).empty?
  end
  
  def current_price
    self.class.get_stock_info(self.ticker)[0]["lastSalePrice"].round(2)
  end
end
