class CreateVisits < ActiveRecord::Migration
  def self.up
    create_table :visits do |t|
      t.datetime :date, :null => false
      t.string :complaint, :null => false
      t.text :diagnosis, :null => false
      t.text :observation
      t.references :doctor
      t.references :patient
      t.timestamps
    end
  end

  def self.down
    drop_table :visits
  end
end
