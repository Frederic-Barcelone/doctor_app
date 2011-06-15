# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110615082614) do

  create_table "doctors", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "visit_counter",                         :default => 0
  end

  add_index "doctors", ["email"], :name => "index_doctors_on_email", :unique => true
  add_index "doctors", ["reset_password_token"], :name => "index_doctors_on_reset_password_token", :unique => true

  create_table "histories", :id => false, :force => true do |t|
    t.integer  "patient_id"
    t.text     "allergies"
    t.text     "social"
    t.text     "medical"
    t.text     "family"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "histories", ["patient_id"], :name => "index_histories_on_patient_id", :unique => true

  create_table "meds", :force => true do |t|
    t.string   "medication", :null => false
    t.string   "dose"
    t.string   "rote"
    t.string   "frequency"
    t.datetime "date",       :null => false
    t.integer  "patient_id"
    t.integer  "doctor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", :force => true do |t|
    t.string   "first_name",                  :null => false
    t.string   "middle_name",                 :null => false
    t.string   "last_name",                   :null => false
    t.datetime "birthdate",                   :null => false
    t.string   "phone"
    t.string   "address"
    t.boolean  "female",                      :null => false
    t.string   "bloodgroup"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "meds_counter", :default => 0
  end

  create_table "visits", :force => true do |t|
    t.datetime "date",        :null => false
    t.string   "complaint",   :null => false
    t.text     "diagnosis",   :null => false
    t.text     "observation"
    t.integer  "doctor_id"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
