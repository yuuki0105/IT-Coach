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

ActiveRecord::Schema.define(version: 2021_03_03_023652) do

  create_table "abilities", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "coach_id", null: false
    t.string "content", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coach_id"], name: "index_abilities_on_coach_id"
  end

  create_table "active_storage_attachments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "careers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "coach_id", null: false
    t.string "organization", null: false
    t.string "role"
    t.date "start_month", null: false
    t.date "end_month"
    t.boolean "ongoing", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coach_id"], name: "index_careers_on_coach_id"
  end

  create_table "coaches", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.boolean "schedule_confirmed", default: false, null: false
    t.integer "examination_status_id", default: 1, null: false
    t.date "examination_result_date", comment: "審査結果日"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_coaches_on_user_id"
  end

  create_table "messages", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.bigint "user_id", null: false
    t.text "content", null: false
    t.boolean "read", default: false, null: false, comment: "既読/未読"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_messages_on_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "notifications", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "message_id"
    t.boolean "read", default: false, null: false, comment: "既読/未読"
    t.integer "notification_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["message_id"], name: "index_notifications_on_message_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "portfolios", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "coach_id", null: false
    t.string "title", null: false
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coach_id"], name: "index_portfolios_on_coach_id"
  end

  create_table "rooms", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "other_user_id", null: false, comment: "もう一人のユーザー"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["other_user_id"], name: "index_rooms_on_other_user_id"
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "skill_categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "en_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "skills", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "skill_category_id", null: false
    t.string "name", null: false, comment: "スキル名"
    t.string "en_name", null: false, comment: "英語スキル名"
    t.boolean "published", default: true, null: false, comment: "公開非公開"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["skill_category_id"], name: "index_skills_on_skill_category_id"
  end

  create_table "sns_accounts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "provider", null: false
    t.string "uid", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_sns_accounts_on_user_id"
  end

  create_table "user_follows", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "follow_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["follow_id"], name: "index_user_follows_on_follow_id"
    t.index ["user_id"], name: "index_user_follows_on_user_id"
  end

  create_table "user_skills", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "skill_id", null: false
    t.integer "experience_year", default: 0, null: false
    t.integer "level", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["skill_id"], name: "index_user_skills_on_skill_id"
    t.index ["user_id"], name: "index_user_skills_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.boolean "identity_verified", default: false, null: false
    t.text "profile"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "yen_per_hours", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "coach_id", null: false
    t.integer "price", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coach_id"], name: "index_yen_per_hours_on_coach_id"
  end

  add_foreign_key "abilities", "coaches"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "careers", "coaches"
  add_foreign_key "coaches", "users"
  add_foreign_key "messages", "rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "notifications", "messages"
  add_foreign_key "notifications", "users"
  add_foreign_key "portfolios", "coaches"
  add_foreign_key "rooms", "users"
  add_foreign_key "rooms", "users", column: "other_user_id"
  add_foreign_key "skills", "skill_categories"
  add_foreign_key "sns_accounts", "users"
  add_foreign_key "user_follows", "users"
  add_foreign_key "user_follows", "users", column: "follow_id"
  add_foreign_key "user_skills", "skills"
  add_foreign_key "user_skills", "users"
  add_foreign_key "yen_per_hours", "coaches"
end
