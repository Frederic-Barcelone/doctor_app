class CreatePatients < ActiveRecord::Migration
  def self.up
    create_table :patients do |t|
      t.string :first_name, :null => false
      t.string :middle_name, :null => false
      t.string :last_name, :null => false
      t.datetime :birthdate, :null => false
      t.string :phone
      t.string :address
      t.boolean :female, :null => false
      t.string :bloodgroup
      t.timestamps
    end
  end

  def self.down
    drop_table :patients
  end
end
