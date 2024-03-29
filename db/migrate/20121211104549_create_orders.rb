class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :movie
      t.decimal :price
      t.text :place
      t.text :seats
      t.integer :user_id
      t.timestamps
    end
    add_index :orders, :user_id
  end
end
