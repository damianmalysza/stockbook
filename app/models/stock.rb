class Stock < ActiveRecord::Base
  has_many :stock_portfolios
  has_many :portfolios, through: :stock_portfolios

  include HTTParty

  @@api_key = YAML.load_file('./api_key.yml')["api_key"]

  base_uri "https://cloud.iexapis.com/stable/tops?token=#{@@api_key}&"

  def current_price
    self.class.get("symbols=#{self.ticker}")[0]["lastSalePrice"]
  end
end
