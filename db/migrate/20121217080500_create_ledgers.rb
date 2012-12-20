class CreateLedgers < ActiveRecord::Migration
  def change
    create_table :ledgers do |t|
      t.integer :debited_from
      t.integer :credited_to
      t.decimal :amount_transferred
      t.string :purpose
      t.timestamps
    end
  end
end
