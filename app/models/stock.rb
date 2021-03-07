class Stock < ActiveRecord::Base
  has_many :stock_watchlists
  has_many :watchlists, through: :stock_watchlists

  include HTTParty

  @@api_key = YAML.load_file('./api_key.yml')["api_key"]

  def self.get_stock_info(ticker)
    get("https://cloud.iexapis.com/stable/stock/#{ticker.upcase}/quote?token=#{@@api_key}")
  end
  
  def self.valid_ticker?(ticker)
    !Stock.get_stock_info(ticker.upcase).parsed_response.include?("Unknown symbol")
  end
 
  def self.create_new_stock(ticker)
    company_name = get_stock_info(ticker.upcase)["companyName"]
    self.create(ticker: ticker.upcase, company_name: company_name)
  end 

  def current_price
    self.class.get_stock_info(self.ticker)["latestPrice"].round(2)
  end
end
