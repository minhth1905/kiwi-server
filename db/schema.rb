# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20171026143940) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.text     "image",       limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content",      limit: 65535
    t.integer  "portfolio_id", limit: 4
    t.integer  "user_id",      limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "comments", ["portfolio_id"], name: "index_comments_on_portfolio_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "contents", force: :cascade do |t|
    t.text     "link",         limit: 65535
    t.text     "content",      limit: 65535
    t.text     "description",  limit: 65535
    t.integer  "portfolio_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "typee",        limit: 4
    t.string   "video",        limit: 255
  end

  add_index "contents", ["portfolio_id"], name: "index_contents_on_portfolio_id", using: :btree

  create_table "portfolios", force: :cascade do |t|
    t.text     "description", limit: 65535
    t.text     "image",       limit: 65535
    t.text     "content",     limit: 65535
    t.integer  "user_id",     limit: 4
    t.integer  "category_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "view",        limit: 4
    t.integer  "like",        limit: 4
    t.string   "video",       limit: 255
    t.string   "name",        limit: 255
  end

  add_index "portfolios", ["category_id"], name: "index_portfolios_on_category_id", using: :btree
  add_index "portfolios", ["user_id"], name: "index_portfolios_on_user_id", using: :btree

  create_table "rates", force: :cascade do |t|
    t.integer  "number",       limit: 4
    t.text     "description",  limit: 65535
    t.integer  "portfolio_id", limit: 4
    t.integer  "user_id",      limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "rates", ["portfolio_id"], name: "index_rates_on_portfolio_id", using: :btree
  add_index "rates", ["user_id"], name: "index_rates_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "username",               limit: 255
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "role",                   limit: 255
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.integer  "failed_attempts",        limit: 4,   default: 0,  null: false
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "comments", "portfolios"
  add_foreign_key "comments", "users"
  add_foreign_key "contents", "portfolios"
  add_foreign_key "portfolios", "categories"
  add_foreign_key "portfolios", "users"
  add_foreign_key "rates", "portfolios"
  add_foreign_key "rates", "users"
end
