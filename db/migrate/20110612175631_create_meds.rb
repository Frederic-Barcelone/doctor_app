class CreateMeds < ActiveRecord::Migration
  def self.up
    create_table :meds do |t|
      t.string :medication, :null => false
      t.string :dose
      t.string :rote
      t.string :frequency
      t.datetime :date, :null => false
      t.integer :patient_id
      t.integer :doctor_id
      t.timestamps
    end
  end

  def self.down
    drop_table :meds
  end
end
