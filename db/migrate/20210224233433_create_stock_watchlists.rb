class CreateStockWatchlists < ActiveRecord::Migration[5.2]
  def change
    create_table :stock_watchlists do |t|
      t.integer :stock_id
      t.integer :watchlist_id
    end
  end
end
