class CreateStockPortfolios < ActiveRecord::Migration
  def change
    create_table :stock_portfolios do |t|

      t.timestamps null: false
    end
  end
end
