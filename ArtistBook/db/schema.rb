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
# It's strongly recommended that you check this file into your version control system.


ActiveRecord::Schema.define(version: 20180415055703) do

  create_table "band_profiles", force: :cascade do |t|
    t.string "bio"
    t.string "photo_path"
    t.string "spotify_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bands", force: :cascade do |t|
    t.string "band_name"
    t.string "genre"
    t.string "phone"
    t.string "address"
    t.string "photo_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.index ["email"], name: "index_bands_on_email", unique: true
    t.index ["reset_password_token"], name: "index_bands_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_bands_on_unlock_token", unique: true
  end

  create_table "business_profiles", force: :cascade do |t|
    t.string "bio"
    t.string "photo_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "business_requests", force: :cascade do |t|
    t.integer "business_id"
    t.integer "band_id"
    t.string "pay"
    t.boolean "band_decision"
    t.string "message"
    t.string "date"
    t.string "time"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["band_id"], name: "index_business_requests_on_band_id"
    t.index ["business_id"], name: "index_business_requests_on_business_id"
  end

  create_table "businesses", force: :cascade do |t|
    t.string "business_name"
    t.string "phone"
    t.string "address"
    t.string "photo_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.index ["email"], name: "index_businesses_on_email", unique: true
    t.index ["reset_password_token"], name: "index_businesses_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_businesses_on_unlock_token", unique: true
  end

  create_table "posts", force: :cascade do |t|
    t.string "message"
    t.string "date"
    t.integer "business_id"
    t.float "pay"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "responses", force: :cascade do |t|
    t.integer "band_id"
    t.integer "post_id"
    t.string "bus_decision"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["band_id"], name: "index_responses_on_band_id"
    t.index ["post_id"], name: "index_responses_on_post_id"
  end

  create_table "searches", force: :cascade do |t|
    t.string "genre"
    t.integer "business_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id"], name: "index_searches_on_business_id"
  end

end
