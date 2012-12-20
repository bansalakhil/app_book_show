class AddDateToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :show_date, :date
  	add_column :orders, :show_time, :time
  end
end
