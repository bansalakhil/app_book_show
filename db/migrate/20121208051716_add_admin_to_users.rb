class AddAdminToUsers < ActiveRecord::Migration
  def change
  	change_table :users do |t|
      t.boolean :is_admin, :default => false
      t.string :name
  	end
   
    drop_table :admins

  end
end
