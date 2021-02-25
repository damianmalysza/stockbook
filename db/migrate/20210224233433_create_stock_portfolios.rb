class CreateStockPortfolios < ActiveRecord::Migration[5.2]
  def change
    create_table :stock_portfolios do |t|
      t.integer :stock_id
      t.integer :portfolio_id
    end
  end
end
