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

ActiveRecord::Schema.define(version: 20160318021448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accesos", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "group_id"
    t.string   "app_id_s"
    t.string   "app_id_h"
    t.string   "asesor"
    t.string   "garantias"
    t.string   "usuario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "accesos", ["user_id"], name: "index_accesos_on_user_id", using: :btree

  create_table "appadmins", force: :cascade do |t|
    t.string   "app_id"
    t.string   "group_id"
    t.string   "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "apps", force: :cascade do |t|
    t.string   "name"
    t.string   "api_key"
    t.string   "group_id"
    t.string   "type_app"
    t.string   "subgroup_id"
    t.string   "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "asesors", force: :cascade do |t|
    t.string   "nombre"
    t.string   "asesor_id"
    t.string   "user_id"
    t.string   "app_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "catalogos", force: :cascade do |t|
    t.string   "mes"
    t.string   "año"
    t.decimal  "objetivo_real"
    t.decimal  "objetivo_obligado"
    t.string   "app_id"
    t.string   "user_id"
    t.string   "group_id"
    t.string   "tipo"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "configuracions", force: :cascade do |t|
    t.string   "internas"
    t.string   "publicas"
    t.string   "dias"
    t.string   "garantias"
    t.string   "dias_garantias"
    t.string   "app_id"
    t.string   "group_id"
    t.string   "tipo"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "crm", force: :cascade do |t|
    t.string   "orden"
    t.string   "app_id"
    t.string   "sucursal_id"
    t.string   "group_id"
    t.string   "asesor_id"
    t.string   "fecha"
    t.string   "fecha_salida"
    t.string   "key"
    t.string   "mes"
    t.string   "año"
    t.string   "tipo"
    t.integer  "dias"
    t.string   "cliente"
    t.string   "telefono"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "crms", force: :cascade do |t|
    t.string   "orden"
    t.string   "app_id"
    t.string   "sucursal_id"
    t.string   "group_id"
    t.string   "asesor_id"
    t.string   "fecha"
    t.string   "fecha_salida"
    t.string   "key"
    t.string   "mes"
    t.string   "año"
    t.string   "tipo"
    t.integer  "dias"
    t.string   "cliente"
    t.string   "telefono"
    t.string   "verificacion"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
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
    t.string   "anio"
    t.string   "sucursal_id"
    t.string   "group_id"
    t.string   "sucursal_tipo"
    t.string   "asesor_id"
    t.string   "key"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "garantia", force: :cascade do |t|
    t.string   "orden"
    t.string   "app_id"
    t.string   "sucursal_id"
    t.string   "group_id"
    t.string   "asesor_id"
    t.string   "fecha"
    t.string   "fecha_salida"
    t.string   "key"
    t.string   "mes"
    t.string   "año"
    t.string   "tipo"
    t.integer  "dias"
    t.string   "cliente"
    t.string   "telefono"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.string   "group_id"
    t.string   "user_id"
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
    t.string   "esquema"
    t.decimal  "importe"
    t.date     "fechapago"
    t.date     "fechavencimiento"
    t.string   "diasalerta"
    t.string   "diascorteacceso"
    t.string   "estatus"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "pendientes", force: :cascade do |t|
    t.string   "orden"
    t.string   "tipo"
    t.decimal  "importe"
    t.date     "fecha"
    t.string   "estatus"
    t.string   "app_id"
    t.string   "sucursal_id"
    t.string   "group_id"
    t.string   "sucursal_tipo"
    t.string   "asesor_id"
    t.string   "key"
    t.string   "cliente"
    t.string   "telefono"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
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
    t.string   "group_id"
    t.string   "app_id"
  end

  add_index "sistemas", ["email"], name: "index_sistemas_on_email", unique: true, using: :btree
  add_index "sistemas", ["reset_password_token"], name: "index_sistemas_on_reset_password_token", unique: true, using: :btree

  create_table "sms", force: :cascade do |t|
    t.string   "telefono"
    t.string   "mensaje"
    t.string   "url"
    t.string   "respuesta"
    t.string   "comentario"
    t.string   "app_id"
    t.string   "group_id"
    t.string   "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subgroups", force: :cascade do |t|
    t.string   "name"
    t.string   "group_id"
    t.string   "subgroup_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

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
    t.string   "app_id"
    t.string   "sucursal_id"
    t.string   "group_id"
    t.string   "subgroup_id"
    t.string   "sistemas_id"
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
