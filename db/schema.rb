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

ActiveRecord::Schema[7.0].define(version: 2024_03_15_121957) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", precision: nil, null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "pet_id", null: false
    t.bigint "user_id", null: false
    t.date "date_start"
    t.date "date_end"
    t.integer "total_amount"
    t.string "status", default: "Submitted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "message"
    t.integer "duration", default: 0
    t.index ["pet_id"], name: "index_bookings_on_pet_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "breeds", force: :cascade do |t|
    t.string "name"
    t.bigint "species_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["species_id"], name: "index_breeds_on_species_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.integer "age"
    t.string "description"
    t.string "location"
    t.float "price_per_day"
    t.boolean "is_available", default: true
    t.float "average_rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "breed_id"
    t.bigint "user_id"
    t.bigint "species_id"
    t.float "latitude"
    t.float "longitude"
    t.index ["breed_id"], name: "index_pets_on_breed_id"
    t.index ["species_id"], name: "index_pets_on_species_id"
    t.index ["user_id"], name: "index_pets_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.bigint "user_id", null: false
    t.bigint "booking_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "species", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.string "first_name"
    t.string "last_name"
    t.boolean "is_pet_owner", default: false
    t.float "average_rating", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "pets"
  add_foreign_key "bookings", "users"
  add_foreign_key "breeds", "species"
  add_foreign_key "pets", "species"
  add_foreign_key "pets", "users"
  add_foreign_key "reviews", "bookings"
  add_foreign_key "reviews", "users"
end
