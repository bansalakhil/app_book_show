class AddColsToAuditoria < ActiveRecord::Migration
  def change
    drop_table :movies
    remove_column :shows, :movie_id
    add_column :shows, :auditorium_id, :integer
    add_column :shows, :movie_name, :string
    add_index :shows, :auditorium_id
  end
end
