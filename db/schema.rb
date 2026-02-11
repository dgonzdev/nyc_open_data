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

ActiveRecord::Schema[7.2].define(version: 2026_02_11_012939) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bicycle_counters", force: :cascade do |t|
    t.integer "original_id"
    t.string "name"
    t.string "domain"
    t.decimal "latitude", precision: 15, scale: 10
    t.decimal "longitude", precision: 15, scale: 10
    t.integer "interval"
    t.string "timezone"
    t.string "sens"
    t.string "counter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["original_id"], name: "index_bicycle_counters_on_original_id", unique: true
  end

  create_table "motor_vehicle_collisions_crashes", force: :cascade do |t|
    t.datetime "crash_date"
    t.datetime "crash_time"
    t.string "borough"
    t.string "zip_code"
    t.decimal "latitude"
    t.decimal "longitude"
    t.jsonb "location"
    t.string "on_street_name"
    t.string "off_street_name"
    t.string "cross_street_name"
    t.integer "number_of_persons_injured"
    t.integer "number_of_persons_killed"
    t.integer "number_of_pedestrians_injured"
    t.integer "number_of_pedestrians_killed"
    t.integer "number_of_cyclist_injured"
    t.integer "number_of_cyclist_killed"
    t.integer "number_of_motorist_injured"
    t.integer "number_of_motorist_killed"
    t.string "contributing_factor_vehicle_1"
    t.string "contributing_factor_vehicle_2"
    t.string "contributing_factor_vehicle_3"
    t.string "contributing_factor_vehicle_4"
    t.string "contributing_factor_vehicle_5"
    t.bigint "collision_id"
    t.string "vehicle_type_code1"
    t.string "vehicle_type_code2"
    t.string "vehicle_type_code_3"
    t.string "vehicle_type_code_4"
    t.string "vehicle_type_code_5"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collision_id"], name: "index_motor_vehicle_collisions_crashes_on_collision_id", unique: true
  end

  create_table "nyc_permitted_event_information_historicals", force: :cascade do |t|
    t.integer "event_id"
    t.string "event_name"
    t.datetime "start_date_time"
    t.datetime "end_date_time"
    t.string "event_agency"
    t.string "event_type"
    t.string "event_borough"
    t.string "event_location"
    t.string "event_street_side"
    t.string "street_closure_type"
    t.string "community_board"
    t.string "police_precinct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id", "start_date_time", "end_date_time"], name: "idx_on_event_id_start_date_time_end_date_time_30413255bd", unique: true
  end

  create_table "nyc_permitted_event_informations", force: :cascade do |t|
    t.integer "event_id"
    t.string "event_name"
    t.datetime "start_date_time"
    t.datetime "end_date_time"
    t.string "event_agency"
    t.string "event_type"
    t.string "event_borough"
    t.string "event_location"
    t.string "event_street_side"
    t.string "street_closure_type"
    t.string "community_board"
    t.string "police_precinct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id", "start_date_time", "end_date_time"], name: "idx_on_event_id_start_date_time_end_date_time_52b05f6aff", unique: true
  end
end
