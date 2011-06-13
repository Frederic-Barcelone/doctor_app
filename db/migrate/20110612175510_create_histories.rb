class CreateHistories < ActiveRecord::Migration
  def self.up
    create_table :histories, :id => false do |t|
      t.integer :patient_id
      t.text :allergies
      t.text :social
      t.text :medical
      t.text :family
      t.timestamps
    end
    add_index :histories, :patient_id, :unique => true
  end

  def self.down
    drop_table :histories
  end
end
