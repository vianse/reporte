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

ActiveRecord::Schema.define(version: 20151119062139) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accesos", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "app_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "accesos", ["user_id"], name: "index_accesos_on_user_id", using: :btree

  create_table "apps", force: :cascade do |t|
    t.string   "name"
    t.string   "api_key"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "catalogos", force: :cascade do |t|
    t.string   "mes"
    t.string   "año"
    t.integer  "objetivo_real"
    t.integer  "objetivo_obligado"
    t.string   "app_id"
    t.string   "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "configuracions", force: :cascade do |t|
    t.string   "abiertas"
    t.string   "facturadas"
    t.string   "internas"
    t.string   "dias"
    t.string   "app_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facturadas", force: :cascade do |t|
    t.string   "orden"
    t.string   "tipo"
    t.decimal  "importe"
    t.date     "fecha"
    t.string   "estatus"
    t.string   "app_id"
    t.string   "factura"
    t.string   "mes"
    t.string   "año"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pagos", force: :cascade do |t|
    t.string   "app_id"
    t.string   "mes"
    t.string   "año"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.string   "app_id"
    t.string   "importe"
    t.date     "fecha"
    t.string   "dias"
    t.string   "estatus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pendientes", force: :cascade do |t|
    t.string   "orden"
    t.string   "tipo"
    t.decimal  "importe"
    t.date     "fecha"
    t.string   "estatus"
    t.string   "app_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sistemas", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "sistemas", ["email"], name: "index_sistemas_on_email", unique: true, using: :btree
  add_index "sistemas", ["reset_password_token"], name: "index_sistemas_on_reset_password_token", unique: true, using: :btree

  create_table "supers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "supers", ["email"], name: "index_supers_on_email", unique: true, using: :btree
  add_index "supers", ["reset_password_token"], name: "index_supers_on_reset_password_token", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "accesos", "users"
end
