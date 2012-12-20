class CreateAuditoria < ActiveRecord::Migration
  def change
    create_table :auditoria do |t|
      t.string :name
      t.references :theatre

      t.timestamps
    end
    add_index :auditoria, :theatre_id
  end
end
