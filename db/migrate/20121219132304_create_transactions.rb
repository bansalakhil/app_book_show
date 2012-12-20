class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :debited_from
      t.integer :credited_to
      t.decimal :amount
      t.text :purpose
      t.timestamps
    end
  end
end
