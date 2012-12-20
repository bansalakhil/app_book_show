class CreateUsers < ActiveRecord::Migration
  def change
    drop_table :users
    create_table :users do |t|
      t.string :name
      t.string :email_id
      t.string :password_digest
      t.decimal :account_balance, :default => 1000
      t.boolean :is_admin, :default => false

      t.timestamps
    end
  end
end
