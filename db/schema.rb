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

ActiveRecord::Schema.define(version: 2021_12_15_154642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "articulos", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clues", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "conexion_bds", force: :cascade do |t|
    t.string "nombre_herramienta"
    t.string "puerto"
    t.string "host"
    t.string "usuario"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "datos", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "departamentos", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "direccions", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "herramienta", force: :cascade do |t|
    t.bigint "conexion_bd_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nombre_sistema"
    t.index ["conexion_bd_id"], name: "index_herramienta_on_conexion_bd_id"
  end

  create_table "informe_generals", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "perfils", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "rol_id"
    t.bigint "user_id"
    t.index ["rol_id"], name: "index_perfils_on_rol_id"
    t.index ["user_id"], name: "index_perfils_on_user_id"
  end

  create_table "personals", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido_p"
    t.string "apellido_m"
    t.string "nombre_completo"
    t.string "telefono"
    t.string "calle"
    t.string "numero"
    t.string "colonia"
    t.integer "cp"
    t.string "curp"
    t.date "fecha_nacimiento"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "plantillas", force: :cascade do |t|
    t.bigint "dato_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "herramientum_id"
    t.index ["dato_id"], name: "index_plantillas_on_dato_id"
    t.index ["herramientum_id"], name: "index_plantillas_on_herramientum_id"
  end

  create_table "relacion_articulos", force: :cascade do |t|
    t.bigint "articulo_id", null: false
    t.bigint "herramienta_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["articulo_id"], name: "index_relacion_articulos_on_articulo_id"
    t.index ["herramienta_id"], name: "index_relacion_articulos_on_herramienta_id"
  end

  create_table "relacion_datos", force: :cascade do |t|
    t.bigint "herramienta_id", null: false
    t.bigint "dato_id", null: false
    t.text "valo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dato_id"], name: "index_relacion_datos_on_dato_id"
    t.index ["herramienta_id"], name: "index_relacion_datos_on_herramienta_id"
  end

  create_table "relacion_herramienta", force: :cascade do |t|
    t.bigint "informe_general_id", null: false
    t.bigint "herramienta_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["herramienta_id"], name: "index_relacion_herramienta_on_herramienta_id"
    t.index ["informe_general_id"], name: "index_relacion_herramienta_on_informe_general_id"
  end

  create_table "rols", force: :cascade do |t|
    t.string "nombre"
    t.text "descripcion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "subdireccions", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "unidads", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: ""
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username", null: false
    t.bigint "unidad_id"
    t.bigint "area_id"
    t.bigint "direccion_id"
    t.bigint "subdireccion_id"
    t.bigint "departamento_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "personal_id"
    t.index ["area_id"], name: "index_users_on_area_id"
    t.index ["departamento_id"], name: "index_users_on_departamento_id"
    t.index ["direccion_id"], name: "index_users_on_direccion_id"
    t.index ["email"], name: "index_users_on_email"
    t.index ["personal_id"], name: "index_users_on_personal_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["subdireccion_id"], name: "index_users_on_subdireccion_id"
    t.index ["unidad_id"], name: "index_users_on_unidad_id"
  end

  add_foreign_key "herramienta", "conexion_bds"
  add_foreign_key "perfils", "rols"
  add_foreign_key "perfils", "users"
  add_foreign_key "plantillas", "datos"
  add_foreign_key "plantillas", "herramienta"
  add_foreign_key "relacion_articulos", "articulos"
  add_foreign_key "relacion_articulos", "herramienta", column: "herramienta_id"
  add_foreign_key "relacion_datos", "datos"
  add_foreign_key "relacion_datos", "herramienta", column: "herramienta_id"
  add_foreign_key "relacion_herramienta", "herramienta", column: "herramienta_id"
  add_foreign_key "relacion_herramienta", "informe_generals"
  add_foreign_key "users", "personals"
end
