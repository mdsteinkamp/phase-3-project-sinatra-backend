# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_08_05_020545) do

  create_table "clients", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.date "date_of_birth"
    t.string "state"
    t.string "spouse_name"
  end

  create_table "policies", force: :cascade do |t|
    t.string "carrier"
    t.string "product"
    t.date "policy_date"
    t.string "policy_number"
    t.integer "face_amount"
    t.date "conversion_expiry"
    t.string "purpose"
    t.string "rate_class"
    t.integer "client_id"
    t.string "status"
  end

end
