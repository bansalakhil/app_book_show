class AddColToOrders < ActiveRecord::Migration
  def change
  	drop_table :orders
  	drop_table :ledgers
  end
end
