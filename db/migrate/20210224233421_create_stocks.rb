class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :ticker
      t.string :company_name
      t.integer :portfolio_id
    end
  end
end
