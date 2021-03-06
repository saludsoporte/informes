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

ActiveRecord::Schema.define(version: 2022_02_23_195822) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "dblink"
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
    t.string "tabla_user"
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

  create_table "entidads", force: :cascade do |t|
    t.string "nombre"
    t.string "abreviatura"
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

  create_table "informe_ctrl_docums", force: :cascade do |t|
    t.date "fecha_doc"
    t.bigint "herramientum_id", null: false
    t.string "nombre_informe"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "fecha_ini"
    t.date "fecha_fin"
    t.boolean "rango", default: false
    t.index ["herramientum_id"], name: "index_informe_ctrl_docums_on_herramientum_id"
    t.index ["user_id"], name: "index_informe_ctrl_docums_on_user_id"
  end

  create_table "informe_generals", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "herramientum_id"
    t.bigint "partida_id"
    t.integer "usuario_informe_id"
    t.string "tipo_informe"
    t.integer "tipo_informacion"
    t.integer "referencia"
    t.integer "memorandum"
    t.string "pdf"
    t.integer "unidad_id"
    t.index ["herramientum_id"], name: "index_informe_generals_on_herramientum_id"
    t.index ["partida_id"], name: "index_informe_generals_on_partida_id"
    t.index ["user_id"], name: "index_informe_generals_on_user_id"
  end

  create_table "partidas", force: :cascade do |t|
    t.integer "partida"
    t.float "indice"
    t.integer "cog2011"
    t.text "descripcion"
    t.text "descripcion2"
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
    t.bigint "dato_id", null: false
    t.text "valo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "herramientum_id"
    t.bigint "informe_general_id"
    t.index ["dato_id"], name: "index_relacion_datos_on_dato_id"
    t.index ["herramientum_id"], name: "index_relacion_datos_on_herramientum_id"
    t.index ["informe_general_id"], name: "index_relacion_datos_on_informe_general_id"
  end

  create_table "relacion_entrada_unidads", force: :cascade do |t|
    t.bigint "informe_general_id", null: false
    t.bigint "unidad_id", null: false
    t.string "caducado"
    t.string "necesita"
    t.string "por_caducar"
    t.string "existencia_fisica"
    t.string "buen_estado"
    t.string "extra"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["informe_general_id"], name: "index_relacion_entrada_unidads_on_informe_general_id"
    t.index ["unidad_id"], name: "index_relacion_entrada_unidads_on_unidad_id"
  end

  create_table "relacion_herramienta", force: :cascade do |t|
    t.bigint "informe_general_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "herramientum_id"
    t.index ["herramientum_id"], name: "index_relacion_herramienta_on_herramientum_id"
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

  create_table "tabla_user_ids", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "herramientum_id", null: false
    t.string "id_user"
    t.string "nombre_herramienta"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nombre_user"
    t.string "usuario"
    t.string "password"
    t.index ["herramientum_id"], name: "index_tabla_user_ids_on_herramientum_id"
    t.index ["user_id"], name: "index_tabla_user_ids_on_user_id"
  end

  create_table "tipo_unidads", force: :cascade do |t|
    t.string "abreviatura"
    t.string "nombre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "unidads", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "clues"
    t.string "telefono", limit: 10
    t.bigint "tipo_unidad_id"
    t.bigint "entidad_id"
    t.date "fecha"
    t.string "calle"
    t.string "numero_ext"
    t.string "numero_int"
    t.string "colonia"
    t.string "entre_calles_1"
    t.string "entre_calles_2"
    t.string "codigo_postal"
    t.index ["entidad_id"], name: "index_unidads_on_entidad_id"
    t.index ["tipo_unidad_id"], name: "index_unidads_on_tipo_unidad_id"
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
    t.string "avatar"
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
  add_foreign_key "informe_ctrl_docums", "herramienta"
  add_foreign_key "informe_ctrl_docums", "users"
  add_foreign_key "informe_generals", "herramienta"
  add_foreign_key "informe_generals", "partidas"
  add_foreign_key "informe_generals", "users"
  add_foreign_key "perfils", "rols"
  add_foreign_key "perfils", "users"
  add_foreign_key "plantillas", "datos"
  add_foreign_key "plantillas", "herramienta"
  add_foreign_key "relacion_articulos", "articulos"
  add_foreign_key "relacion_articulos", "herramienta", column: "herramienta_id"
  add_foreign_key "relacion_datos", "datos"
  add_foreign_key "relacion_datos", "herramienta"
  add_foreign_key "relacion_datos", "informe_generals"
  add_foreign_key "relacion_entrada_unidads", "informe_generals"
  add_foreign_key "relacion_entrada_unidads", "unidads"
  add_foreign_key "relacion_herramienta", "herramienta"
  add_foreign_key "relacion_herramienta", "informe_generals"
  add_foreign_key "tabla_user_ids", "herramienta"
  add_foreign_key "tabla_user_ids", "users"
  add_foreign_key "unidads", "entidads"
  add_foreign_key "unidads", "tipo_unidads"
  add_foreign_key "users", "personals"
end
