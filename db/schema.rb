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

ActiveRecord::Schema.define(version: 20170323075226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adiccion_perfiles", force: :cascade do |t|
    t.integer  "adiccion_id"
    t.integer  "perfil_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["adiccion_id"], name: "index_adiccion_perfiles_on_adiccion_id", using: :btree
    t.index ["perfil_id"], name: "index_adiccion_perfiles_on_perfil_id", using: :btree
  end

  create_table "adiccion_personas", force: :cascade do |t|
    t.integer  "persona_id",              null: false
    t.integer  "adiccion_id",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["adiccion_id"], name: "index_adiccion_personas_on_adiccion_id", using: :btree
    t.index ["persona_id"], name: "index_adiccion_personas_on_persona_id", using: :btree
  end

  create_table "adicciones", force: :cascade do |t|
    t.string   "descripcion",                  null: false
    t.integer  "estatus",          default: 1, null: false
    t.integer  "tipo_adiccion_id",             null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["tipo_adiccion_id"], name: "index_adicciones_on_tipo_adiccion_id", using: :btree
  end

  create_table "bd_admins", force: :cascade do |t|
    t.string   "historico",      default: [],              array: true
    t.datetime "hora_backup"
    t.integer  "opcion_estatus"
    t.datetime "fecha_inicio"
    t.integer  "estatus"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "busquedas", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus",          default: 1, null: false
    t.integer  "tipo_busqueda_id",             null: false
    t.integer  "especialidad_id"
    t.integer  "especialista_id"
    t.integer  "tipo_servicio_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["especialidad_id"], name: "index_busquedas_on_especialidad_id", using: :btree
    t.index ["especialista_id"], name: "index_busquedas_on_especialista_id", using: :btree
    t.index ["tipo_busqueda_id"], name: "index_busquedas_on_tipo_busqueda_id", using: :btree
    t.index ["tipo_servicio_id"], name: "index_busquedas_on_tipo_servicio_id", using: :btree
  end

  create_table "calificaciones", force: :cascade do |t|
    t.string   "descripcion",                      null: false
    t.integer  "estatus",              default: 1, null: false
    t.integer  "tipo_calificacion_id",             null: false
    t.integer  "criterio_id",                      null: false
    t.integer  "evaluacion_id",                    null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["criterio_id"], name: "index_calificaciones_on_criterio_id", using: :btree
    t.index ["evaluacion_id"], name: "index_calificaciones_on_evaluacion_id", using: :btree
    t.index ["tipo_calificacion_id"], name: "index_calificaciones_on_tipo_calificacion_id", using: :btree
  end

  create_table "categorias", force: :cascade do |t|
    t.string   "descripcion",                   null: false
    t.integer  "estatus",           default: 1, null: false
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "slug"
    t.index ["slug"], name: "index_categorias_on_slug", unique: true, using: :btree
  end

  create_table "cirugia_perfiles", force: :cascade do |t|
    t.integer  "cirugia_id"
    t.integer  "perfil_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cirugia_id"], name: "index_cirugia_perfiles_on_cirugia_id", using: :btree
    t.index ["perfil_id"], name: "index_cirugia_perfiles_on_perfil_id", using: :btree
  end

  create_table "cirugia_personas", force: :cascade do |t|
    t.integer  "persona_id",             null: false
    t.integer  "cirugia_id",             null: false
    t.integer  "estatus",    default: 1, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["cirugia_id"], name: "index_cirugia_personas_on_cirugia_id", using: :btree
    t.index ["persona_id"], name: "index_cirugia_personas_on_persona_id", using: :btree
  end

  create_table "cirugias", force: :cascade do |t|
    t.string   "descripcion",                 null: false
    t.integer  "estatus",         default: 1, null: false
    t.integer  "tipo_cirugia_id",             null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["tipo_cirugia_id"], name: "index_cirugias_on_tipo_cirugia_id", using: :btree
  end

  create_table "citas", force: :cascade do |t|
    t.integer  "turno_id",                    null: false
    t.integer  "persona_id",                  null: false
    t.integer  "usuario_id"
    t.datetime "fecha"
    t.integer  "tipo_pago_id"
    t.integer  "eventualidad_id"
    t.integer  "estatus",         default: 1, null: false
    t.integer  "tipo_cita_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.text     "diagnostico"
    t.index ["eventualidad_id"], name: "index_citas_on_eventualidad_id", using: :btree
    t.index ["persona_id"], name: "index_citas_on_persona_id", using: :btree
    t.index ["tipo_cita_id"], name: "index_citas_on_tipo_cita_id", using: :btree
    t.index ["tipo_pago_id"], name: "index_citas_on_tipo_pago_id", using: :btree
    t.index ["turno_id"], name: "index_citas_on_turno_id", using: :btree
    t.index ["usuario_id"], name: "index_citas_on_usuario_id", using: :btree
  end

  create_table "ciudades", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.integer  "estado_id",               null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["estado_id"], name: "index_ciudades_on_estado_id", using: :btree
  end

  create_table "configuraciones", force: :cascade do |t|
    t.integer  "envia_email"
    t.integer  "envia_notificaciones"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "criterio_tipo_servicios", force: :cascade do |t|
    t.integer  "criterio_id",                  null: false
    t.integer  "tipo_servicio_id",             null: false
    t.integer  "estatus",          default: 1, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["criterio_id"], name: "index_criterio_tipo_servicios_on_criterio_id", using: :btree
    t.index ["tipo_servicio_id"], name: "index_criterio_tipo_servicios_on_tipo_servicio_id", using: :btree
  end

  create_table "criterios", force: :cascade do |t|
    t.string   "descripcion",                  null: false
    t.integer  "estatus",          default: 1, null: false
    t.integer  "tipo_criterio_id",             null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["tipo_criterio_id"], name: "index_criterios_on_tipo_criterio_id", using: :btree
  end

  create_table "dias", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "difusion_medio_difusiones", force: :cascade do |t|
    t.integer  "difusion_id"
    t.integer  "medio_difusion_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["difusion_id"], name: "index_difusion_medio_difusiones_on_difusion_id", using: :btree
    t.index ["medio_difusion_id"], name: "index_difusion_medio_difusiones_on_medio_difusion_id", using: :btree
  end

  create_table "difusiones", force: :cascade do |t|
    t.text     "asunto"
    t.text     "texto"
    t.string   "imagen_file_name"
    t.string   "imagen_content_type"
    t.integer  "imagen_file_size"
    t.datetime "imagen_updated_at"
    t.integer  "tipo_entidad_id"
    t.integer  "entidad_id"
    t.string   "token_facebook"
    t.integer  "tipo_difusion_id",                null: false
    t.integer  "estatus",             default: 1, null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "avatar"
    t.index ["entidad_id"], name: "index_difusiones_on_entidad_id", using: :btree
    t.index ["tipo_difusion_id"], name: "index_difusiones_on_tipo_difusion_id", using: :btree
    t.index ["tipo_entidad_id"], name: "index_difusiones_on_tipo_entidad_id", using: :btree
  end

  create_table "discapacidad_perfiles", force: :cascade do |t|
    t.integer  "discapacidad_id"
    t.integer  "perfil_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["discapacidad_id"], name: "index_discapacidad_perfiles_on_discapacidad_id", using: :btree
    t.index ["perfil_id"], name: "index_discapacidad_perfiles_on_perfil_id", using: :btree
  end

  create_table "discapacidad_personas", force: :cascade do |t|
    t.integer  "persona_id",                  null: false
    t.integer  "discapacidad_id",             null: false
    t.integer  "estatus",         default: 1, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["discapacidad_id"], name: "index_discapacidad_personas_on_discapacidad_id", using: :btree
    t.index ["persona_id"], name: "index_discapacidad_personas_on_persona_id", using: :btree
  end

  create_table "discapacidades", force: :cascade do |t|
    t.string   "descripcion",                      null: false
    t.integer  "estatus",              default: 1, null: false
    t.integer  "tipo_discapacidad_id",             null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["tipo_discapacidad_id"], name: "index_discapacidades_on_tipo_discapacidad_id", using: :btree
  end

  create_table "especialidad_especialistas", force: :cascade do |t|
    t.integer  "especialidad_id"
    t.integer  "especialista_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["especialidad_id"], name: "index_especialidad_especialistas_on_especialidad_id", using: :btree
    t.index ["especialista_id"], name: "index_especialidad_especialistas_on_especialista_id", using: :btree
  end

  create_table "especialidades", force: :cascade do |t|
    t.string   "descripcion",                      null: false
    t.integer  "tipo_especialidad_id"
    t.integer  "estatus",              default: 1, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["tipo_especialidad_id"], name: "index_especialidades_on_tipo_especialidad_id", using: :btree
  end

  create_table "especialistas", force: :cascade do |t|
    t.integer  "universidad_id"
    t.integer  "formacion_academica_id"
    t.integer  "persona_id",                           null: false
    t.string   "estatus",                default: "1", null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["formacion_academica_id"], name: "index_especialistas_on_formacion_academica_id", using: :btree
    t.index ["persona_id"], name: "index_especialistas_on_persona_id", using: :btree
    t.index ["universidad_id"], name: "index_especialistas_on_universidad_id", using: :btree
  end

  create_table "estado_civil_perfiles", force: :cascade do |t|
    t.integer  "estado_civil_id"
    t.integer  "perfil_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["estado_civil_id"], name: "index_estado_civil_perfiles_on_estado_civil_id", using: :btree
    t.index ["perfil_id"], name: "index_estado_civil_perfiles_on_perfil_id", using: :btree
  end

  create_table "estado_civiles", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "estados", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.integer  "pais_id",                 null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["pais_id"], name: "index_estados_on_pais_id", using: :btree
  end

  create_table "evaluaciones", force: :cascade do |t|
    t.string   "descripcion",                    null: false
    t.integer  "estatus",            default: 1, null: false
    t.integer  "tipo_evaluacion_id",             null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "cita_id"
    t.index ["cita_id"], name: "index_evaluaciones_on_cita_id", using: :btree
    t.index ["tipo_evaluacion_id"], name: "index_evaluaciones_on_tipo_evaluacion_id", using: :btree
  end

  create_table "eventos", force: :cascade do |t|
    t.string   "descripcion",                   null: false
    t.integer  "estatus",           default: 1, null: false
    t.integer  "tipo_evento_id",                null: false
    t.integer  "ubicacion_id",                  null: false
    t.datetime "fecha"
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
    t.text     "contenido"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "slug"
    t.index ["slug"], name: "index_eventos_on_slug", unique: true, using: :btree
    t.index ["tipo_evento_id"], name: "index_eventos_on_tipo_evento_id", using: :btree
    t.index ["ubicacion_id"], name: "index_eventos_on_ubicacion_id", using: :btree
  end

  create_table "eventualidades", force: :cascade do |t|
    t.string   "descripcion",                      null: false
    t.integer  "estatus",              default: 1, null: false
    t.integer  "tipo_eventualidad_id",             null: false
    t.integer  "motivo_id"
    t.datetime "fecha_inicio",                     null: false
    t.datetime "fecha_fin"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["motivo_id"], name: "index_eventualidades_on_motivo_id", using: :btree
    t.index ["tipo_eventualidad_id"], name: "index_eventualidades_on_tipo_eventualidad_id", using: :btree
  end

  create_table "formacion_academicas", force: :cascade do |t|
    t.string   "descripcion",                    null: false
    t.integer  "estatus",            default: 1, null: false
    t.integer  "nivel_formacion_id",             null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["nivel_formacion_id"], name: "index_formacion_academicas_on_nivel_formacion_id", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "grupo_sanguineo_perfiles", force: :cascade do |t|
    t.integer  "grupo_sanguineo_id"
    t.integer  "perfil_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["grupo_sanguineo_id"], name: "index_grupo_sanguineo_perfiles_on_grupo_sanguineo_id", using: :btree
    t.index ["perfil_id"], name: "index_grupo_sanguineo_perfiles_on_perfil_id", using: :btree
  end

  create_table "grupo_sanguineos", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "habito_perfiles", force: :cascade do |t|
    t.integer  "habito_id"
    t.integer  "perfil_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["habito_id"], name: "index_habito_perfiles_on_habito_id", using: :btree
    t.index ["perfil_id"], name: "index_habito_perfiles_on_perfil_id", using: :btree
  end

  create_table "habito_personas", force: :cascade do |t|
    t.integer  "persona_id",             null: false
    t.integer  "habito_id",              null: false
    t.integer  "estatus",    default: 1, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["habito_id"], name: "index_habito_personas_on_habito_id", using: :btree
    t.index ["persona_id"], name: "index_habito_personas_on_persona_id", using: :btree
  end

  create_table "habitos", force: :cascade do |t|
    t.string   "descripcion",                null: false
    t.integer  "estatus",        default: 1, null: false
    t.integer  "tipo_habito_id",             null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["tipo_habito_id"], name: "index_habitos_on_tipo_habito_id", using: :btree
  end

  create_table "his_calificaciones", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.integer  "tipo_calificacion"
    t.integer  "criterio"
    t.integer  "evaluacion"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "his_citas", force: :cascade do |t|
    t.integer  "turno"
    t.integer  "persona"
    t.integer  "usuario"
    t.datetime "fecha"
    t.integer  "tipo_pago"
    t.integer  "eventualidad"
    t.integer  "cita"
    t.integer  "estatus"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "his_difusiones", force: :cascade do |t|
    t.text     "asunto"
    t.text     "texto"
    t.string   "imagen_file_name"
    t.string   "imagen_content_type"
    t.integer  "imagen_file_size"
    t.datetime "imagen_updated_at"
    t.integer  "tipo_entidad"
    t.integer  "entidad"
    t.string   "token"
    t.integer  "tipo_difusion"
    t.integer  "estatus"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "his_especialistas", force: :cascade do |t|
    t.integer  "universidad"
    t.integer  "formacion_academica"
    t.integer  "persona"
    t.integer  "estatus"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "his_opiniones", force: :cascade do |t|
    t.string   "correo"
    t.string   "nombre"
    t.string   "descripcion"
    t.integer  "tipo_opinion"
    t.integer  "motivo"
    t.integer  "estatus"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "his_personas", force: :cascade do |t|
    t.string   "cedula"
    t.string   "nombre"
    t.string   "apellido"
    t.string   "telefono"
    t.string   "direccion"
    t.date     "fecha_nacimiento"
    t.integer  "sexo"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "his_servicios", force: :cascade do |t|
    t.text     "descripcion"
    t.integer  "ubicacion"
    t.integer  "tipo_servicio"
    t.integer  "especialista"
    t.integer  "estatus"
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
    t.float    "precio"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "his_tipo_servicios", force: :cascade do |t|
    t.string   "descripcion"
    t.text     "texto"
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
    t.integer  "estatus"
    t.integer  "categoria"
    t.integer  "especialidad"
    t.integer  "tipo_atencion"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "his_usuarios", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "persona"
    t.integer  "rol"
    t.integer  "servicio"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "historial_citas", force: :cascade do |t|
    t.integer  "estatus_nuevo",    null: false
    t.integer  "estatus_anterior", null: false
    t.datetime "fecha",            null: false
    t.integer  "cita_id",          null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["cita_id"], name: "index_historial_citas_on_cita_id", using: :btree
  end

  create_table "horarios", force: :cascade do |t|
    t.integer  "tiempo_cita"
    t.integer  "estatus",         default: 1, null: false
    t.integer  "tipo_horario_id",             null: false
    t.integer  "servicio_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["servicio_id"], name: "index_horarios_on_servicio_id", using: :btree
    t.index ["tipo_horario_id"], name: "index_horarios_on_tipo_horario_id", using: :btree
  end

  create_table "informacion_generals", force: :cascade do |t|
    t.string   "nombre",                 null: false
    t.string   "rif",                    null: false
    t.text     "direccion",              null: false
    t.string   "tlf"
    t.string   "tlf2"
    t.string   "email"
    t.text     "widgetFB"
    t.text     "widgetTW"
    t.text     "url_fb"
    t.text     "url_tw"
    t.text     "url_ins"
    t.text     "url_gp"
    t.text     "url_app"
    t.string   "slogan"
    t.string   "logo"
    t.float    "latitud"
    t.float    "longitud"
    t.integer  "estatus",    default: 1, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "lesion_perfiles", force: :cascade do |t|
    t.integer  "lesion_id"
    t.integer  "perfil_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesion_id"], name: "index_lesion_perfiles_on_lesion_id", using: :btree
    t.index ["perfil_id"], name: "index_lesion_perfiles_on_perfil_id", using: :btree
  end

  create_table "lesion_personas", force: :cascade do |t|
    t.integer  "persona_id",             null: false
    t.integer  "lesion_id",              null: false
    t.integer  "estatus",    default: 1, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["lesion_id"], name: "index_lesion_personas_on_lesion_id", using: :btree
    t.index ["persona_id"], name: "index_lesion_personas_on_persona_id", using: :btree
  end

  create_table "lesiones", force: :cascade do |t|
    t.string   "descripcion",                null: false
    t.integer  "estatus",        default: 1, null: false
    t.integer  "tipo_lesion_id",             null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["tipo_lesion_id"], name: "index_lesiones_on_tipo_lesion_id", using: :btree
  end

  create_table "medio_difusiones", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "motivos", force: :cascade do |t|
    t.string   "descripcion",                null: false
    t.integer  "estatus",        default: 1, null: false
    t.integer  "tipo_motivo_id",             null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["tipo_motivo_id"], name: "index_motivos_on_tipo_motivo_id", using: :btree
  end

  create_table "nivel_formaciones", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "noticias", force: :cascade do |t|
    t.string   "titulo"
    t.string   "descripcion",                 null: false
    t.integer  "tipo_noticia_id"
    t.integer  "estatus",         default: 1, null: false
    t.text     "contenido"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "slug"
    t.index ["slug"], name: "index_noticias_on_slug", unique: true, using: :btree
    t.index ["tipo_noticia_id"], name: "index_noticias_on_tipo_noticia_id", using: :btree
  end

  create_table "notificaciones", force: :cascade do |t|
    t.string   "descripcion",                      null: false
    t.integer  "estatus",              default: 1, null: false
    t.integer  "tipo_notificacion_id",             null: false
    t.string   "mensaje"
    t.string   "url"
    t.integer  "entidad_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "usuario_id"
    t.index ["tipo_notificacion_id"], name: "index_notificaciones_on_tipo_notificacion_id", using: :btree
    t.index ["usuario_id"], name: "index_notificaciones_on_usuario_id", using: :btree
  end

  create_table "ocupacion_perfiles", force: :cascade do |t|
    t.integer  "ocupacion_id"
    t.integer  "perfil_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["ocupacion_id"], name: "index_ocupacion_perfiles_on_ocupacion_id", using: :btree
    t.index ["perfil_id"], name: "index_ocupacion_perfiles_on_perfil_id", using: :btree
  end

  create_table "ocupacion_personas", force: :cascade do |t|
    t.integer  "persona_id",               null: false
    t.integer  "ocupacion_id",             null: false
    t.integer  "estatus",      default: 1, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["ocupacion_id"], name: "index_ocupacion_personas_on_ocupacion_id", using: :btree
    t.index ["persona_id"], name: "index_ocupacion_personas_on_persona_id", using: :btree
  end

  create_table "ocupaciones", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "opiniones", force: :cascade do |t|
    t.string   "correo"
    t.string   "nombre"
    t.string   "descripcion",                 null: false
    t.integer  "tipo_opinion_id"
    t.integer  "motivo_id"
    t.integer  "estatus",         default: 1, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["motivo_id"], name: "index_opiniones_on_motivo_id", using: :btree
    t.index ["tipo_opinion_id"], name: "index_opiniones_on_tipo_opinion_id", using: :btree
  end

  create_table "option_menus", force: :cascade do |t|
    t.integer  "id_padre"
    t.string   "nombre",                  null: false
    t.string   "url_path"
    t.string   "icono"
    t.string   "controlador"
    t.string   "accion"
    t.integer  "num_hijos"
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "option_roles", force: :cascade do |t|
    t.integer  "option_menu_id", null: false
    t.integer  "rol_id",         null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["option_menu_id"], name: "index_option_roles_on_option_menu_id", using: :btree
    t.index ["rol_id"], name: "index_option_roles_on_rol_id", using: :btree
  end

  create_table "paises", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.string   "codigo"
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "parentescos", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "persona_id",                     null: false
    t.integer  "pariente_id",                    null: false
    t.integer  "tipo_parentesco_id",             null: false
    t.integer  "estatus",            default: 1, null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["pariente_id"], name: "index_parentescos_on_pariente_id", using: :btree
    t.index ["persona_id"], name: "index_parentescos_on_persona_id", using: :btree
    t.index ["tipo_parentesco_id"], name: "index_parentescos_on_tipo_parentesco_id", using: :btree
  end

  create_table "patologia_perfiles", force: :cascade do |t|
    t.integer  "patologia_id"
    t.integer  "perfil_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["patologia_id"], name: "index_patologia_perfiles_on_patologia_id", using: :btree
    t.index ["perfil_id"], name: "index_patologia_perfiles_on_perfil_id", using: :btree
  end

  create_table "patologia_personas", force: :cascade do |t|
    t.integer  "persona_id",               null: false
    t.integer  "patologia_id",             null: false
    t.integer  "estatus",      default: 1, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["patologia_id"], name: "index_patologia_personas_on_patologia_id", using: :btree
    t.index ["persona_id"], name: "index_patologia_personas_on_persona_id", using: :btree
  end

  create_table "patologias", force: :cascade do |t|
    t.string   "descripcion",                   null: false
    t.integer  "estatus",           default: 1, null: false
    t.integer  "tipo_patologia_id",             null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["tipo_patologia_id"], name: "index_patologias_on_tipo_patologia_id", using: :btree
  end

  create_table "perfil_tipo_servicios", force: :cascade do |t|
    t.integer  "tipo_servicio_id"
    t.integer  "perfil_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["perfil_id"], name: "index_perfil_tipo_servicios_on_perfil_id", using: :btree
    t.index ["tipo_servicio_id"], name: "index_perfil_tipo_servicios_on_tipo_servicio_id", using: :btree
  end

  create_table "perfil_vacunas", force: :cascade do |t|
    t.integer  "vacuna_id"
    t.integer  "perfil_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["perfil_id"], name: "index_perfil_vacunas_on_perfil_id", using: :btree
    t.index ["vacuna_id"], name: "index_perfil_vacunas_on_vacuna_id", using: :btree
  end

  create_table "perfiles", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "persona_profesiones", force: :cascade do |t|
    t.integer  "persona_id",               null: false
    t.integer  "profesion_id",             null: false
    t.integer  "estatus",      default: 1, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["persona_id"], name: "index_persona_profesiones_on_persona_id", using: :btree
    t.index ["profesion_id"], name: "index_persona_profesiones_on_profesion_id", using: :btree
  end

  create_table "persona_vacunas", force: :cascade do |t|
    t.integer  "persona_id",             null: false
    t.integer  "vacuna_id"
    t.integer  "estatus",    default: 1, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["persona_id"], name: "index_persona_vacunas_on_persona_id", using: :btree
    t.index ["vacuna_id"], name: "index_persona_vacunas_on_vacuna_id", using: :btree
  end

  create_table "personas", force: :cascade do |t|
    t.string   "cedula"
    t.string   "nombre"
    t.string   "apellido"
    t.string   "telefono"
    t.string   "direccion"
    t.date     "fecha_nacimiento"
    t.float    "peso"
    t.float    "altura"
    t.integer  "sexo_id",            null: false
    t.integer  "grupo_sanguineo_id"
    t.integer  "estado_civil_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "referencia_id"
    t.index ["estado_civil_id"], name: "index_personas_on_estado_civil_id", using: :btree
    t.index ["grupo_sanguineo_id"], name: "index_personas_on_grupo_sanguineo_id", using: :btree
    t.index ["referencia_id"], name: "index_personas_on_referencia_id", using: :btree
    t.index ["sexo_id"], name: "index_personas_on_sexo_id", using: :btree
  end

  create_table "plantilla_correos", force: :cascade do |t|
    t.string   "descripcion"
    t.text     "texto"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "preguntas", force: :cascade do |t|
    t.string   "descripcion",                  null: false
    t.string   "respuesta"
    t.integer  "tipo_pregunta_id"
    t.integer  "estatus",          default: 1, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["tipo_pregunta_id"], name: "index_preguntas_on_tipo_pregunta_id", using: :btree
  end

  create_table "profesion_perfiles", force: :cascade do |t|
    t.integer  "profesion_id"
    t.integer  "perfil_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["perfil_id"], name: "index_profesion_perfiles_on_perfil_id", using: :btree
    t.index ["profesion_id"], name: "index_profesion_perfiles_on_profesion_id", using: :btree
  end

  create_table "profesiones", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "rango_edad_perfiles", force: :cascade do |t|
    t.integer  "rango_edad_id"
    t.integer  "perfil_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["perfil_id"], name: "index_rango_edad_perfiles_on_perfil_id", using: :btree
    t.index ["rango_edad_id"], name: "index_rango_edad_perfiles_on_rango_edad_id", using: :btree
  end

  create_table "rango_edades", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "edad_inicial"
    t.integer  "edad_final"
    t.integer  "estatus",      default: 1, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "rango_peso_perfiles", force: :cascade do |t|
    t.integer  "rango_peso_id"
    t.integer  "perfil_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["perfil_id"], name: "index_rango_peso_perfiles_on_perfil_id", using: :btree
    t.index ["rango_peso_id"], name: "index_rango_peso_perfiles_on_rango_peso_id", using: :btree
  end

  create_table "rango_pesos", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "peso_inicial"
    t.integer  "peso_final"
    t.integer  "estatus",      default: 1, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "referencias", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "descripcion", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sectores", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "servicios", force: :cascade do |t|
    t.text     "descripcion"
    t.integer  "ubicacion_id"
    t.integer  "tipo_servicio_id",              null: false
    t.integer  "especialista_id"
    t.integer  "estatus",           default: 1, null: false
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
    t.float    "precio"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "slug"
    t.index ["especialista_id"], name: "index_servicios_on_especialista_id", using: :btree
    t.index ["slug"], name: "index_servicios_on_slug", unique: true, using: :btree
    t.index ["tipo_servicio_id"], name: "index_servicios_on_tipo_servicio_id", using: :btree
    t.index ["ubicacion_id"], name: "index_servicios_on_ubicacion_id", using: :btree
  end

  create_table "sexo_perfiles", force: :cascade do |t|
    t.integer  "sexo_id"
    t.integer  "perfil_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["perfil_id"], name: "index_sexo_perfiles_on_perfil_id", using: :btree
    t.index ["sexo_id"], name: "index_sexo_perfiles_on_sexo_id", using: :btree
  end

  create_table "sexos", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "suscriptores", force: :cascade do |t|
    t.string   "email"
    t.integer  "persona_id"
    t.integer  "estatus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["persona_id"], name: "index_suscriptores_on_persona_id", using: :btree
  end

  create_table "tipo_adicciones", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "tipo_atenciones", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "tipo_busquedas", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "tipo_calificaciones", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "tipo_cirugias", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "tipo_citas", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tipo_criterios", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "tipo_difusiones", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "tipo_discapacidades", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "tipo_entidades", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "tipo_especialidades", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "tipo_evaluaciones", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "tipo_eventos", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "slug"
    t.index ["slug"], name: "index_tipo_eventos_on_slug", unique: true, using: :btree
  end

  create_table "tipo_eventualidades", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "tipo_habitos", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "tipo_horarios", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "tipo_lesiones", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "tipo_motivos", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "tipo_noticias", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "slug"
    t.index ["slug"], name: "index_tipo_noticias_on_slug", unique: true, using: :btree
  end

  create_table "tipo_notificaciones", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "tipo_opiniones", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "tipo_pagos", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "tipo_parentescos", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "tipo_patologias", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "tipo_preguntas", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "tipo_servicio_eventos", force: :cascade do |t|
    t.integer  "estatus",          default: 1, null: false
    t.integer  "tipo_servicio_id",             null: false
    t.integer  "evento_id",                    null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["evento_id"], name: "index_tipo_servicio_eventos_on_evento_id", using: :btree
    t.index ["tipo_servicio_id"], name: "index_tipo_servicio_eventos_on_tipo_servicio_id", using: :btree
  end

  create_table "tipo_servicios", force: :cascade do |t|
    t.string   "descripcion"
    t.text     "texto"
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
    t.integer  "estatus",           default: 1, null: false
    t.integer  "categoria_id",                  null: false
    t.integer  "especialidad_id",               null: false
    t.integer  "tipo_atencion_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "slug"
    t.index ["categoria_id"], name: "index_tipo_servicios_on_categoria_id", using: :btree
    t.index ["especialidad_id"], name: "index_tipo_servicios_on_especialidad_id", using: :btree
    t.index ["slug"], name: "index_tipo_servicios_on_slug", unique: true, using: :btree
    t.index ["tipo_atencion_id"], name: "index_tipo_servicios_on_tipo_atencion_id", using: :btree
  end

  create_table "tipo_turnos", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "tipo_ubicaciones", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "turnos", force: :cascade do |t|
    t.time     "hora_inicio"
    t.time     "hora_fin"
    t.integer  "estatus",            default: 1, null: false
    t.integer  "cantidad_pacientes"
    t.integer  "dia_id"
    t.integer  "horario_id"
    t.integer  "tipo_turno_id",                  null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["dia_id"], name: "index_turnos_on_dia_id", using: :btree
    t.index ["horario_id"], name: "index_turnos_on_horario_id", using: :btree
    t.index ["tipo_turno_id"], name: "index_turnos_on_tipo_turno_id", using: :btree
  end

  create_table "ubicaciones", force: :cascade do |t|
    t.string   "descripcion",                   null: false
    t.integer  "estatus",           default: 1, null: false
    t.integer  "sector_id"
    t.integer  "ciudad_id"
    t.integer  "tipo_ubicacion_id",             null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["ciudad_id"], name: "index_ubicaciones_on_ciudad_id", using: :btree
    t.index ["sector_id"], name: "index_ubicaciones_on_sector_id", using: :btree
    t.index ["tipo_ubicacion_id"], name: "index_ubicaciones_on_tipo_ubicacion_id", using: :btree
  end

  create_table "universidades", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "usuarios", force: :cascade do |t|
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
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
    t.integer  "estatus",                default: 1,  null: false
    t.integer  "persona_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "rol_id"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "servicio_id"
    t.index ["confirmation_token"], name: "index_usuarios_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
    t.index ["persona_id"], name: "index_usuarios_on_persona_id", using: :btree
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree
    t.index ["rol_id"], name: "index_usuarios_on_rol_id", using: :btree
    t.index ["servicio_id"], name: "index_usuarios_on_servicio_id", using: :btree
  end

  create_table "vacunas", force: :cascade do |t|
    t.string   "descripcion",             null: false
    t.integer  "estatus",     default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_foreign_key "adiccion_perfiles", "adicciones"
  add_foreign_key "adiccion_perfiles", "perfiles"
  add_foreign_key "adiccion_personas", "adicciones"
  add_foreign_key "adiccion_personas", "personas"
  add_foreign_key "adicciones", "tipo_adicciones"
  add_foreign_key "busquedas", "especialidades"
  add_foreign_key "busquedas", "especialistas"
  add_foreign_key "busquedas", "tipo_busquedas"
  add_foreign_key "busquedas", "tipo_servicios"
  add_foreign_key "calificaciones", "criterios"
  add_foreign_key "calificaciones", "evaluaciones"
  add_foreign_key "calificaciones", "tipo_calificaciones"
  add_foreign_key "cirugia_perfiles", "cirugias"
  add_foreign_key "cirugia_perfiles", "perfiles"
  add_foreign_key "cirugia_personas", "cirugias"
  add_foreign_key "cirugia_personas", "personas"
  add_foreign_key "cirugias", "tipo_cirugias"
  add_foreign_key "citas", "eventualidades"
  add_foreign_key "citas", "personas"
  add_foreign_key "citas", "tipo_citas"
  add_foreign_key "citas", "tipo_pagos"
  add_foreign_key "citas", "turnos"
  add_foreign_key "citas", "usuarios"
  add_foreign_key "ciudades", "estados"
  add_foreign_key "criterio_tipo_servicios", "criterios"
  add_foreign_key "criterio_tipo_servicios", "tipo_servicios"
  add_foreign_key "criterios", "tipo_criterios"
  add_foreign_key "difusion_medio_difusiones", "difusiones"
  add_foreign_key "difusion_medio_difusiones", "medio_difusiones"
  add_foreign_key "difusiones", "tipo_difusiones"
  add_foreign_key "difusiones", "tipo_entidades"
  add_foreign_key "discapacidad_perfiles", "discapacidades"
  add_foreign_key "discapacidad_perfiles", "perfiles"
  add_foreign_key "discapacidad_personas", "discapacidades"
  add_foreign_key "discapacidad_personas", "personas"
  add_foreign_key "discapacidades", "tipo_discapacidades"
  add_foreign_key "especialidad_especialistas", "especialidades"
  add_foreign_key "especialidad_especialistas", "especialistas"
  add_foreign_key "especialistas", "formacion_academicas"
  add_foreign_key "especialistas", "personas"
  add_foreign_key "especialistas", "universidades"
  add_foreign_key "estado_civil_perfiles", "estado_civiles"
  add_foreign_key "estado_civil_perfiles", "perfiles"
  add_foreign_key "estados", "paises"
  add_foreign_key "evaluaciones", "citas"
  add_foreign_key "evaluaciones", "tipo_evaluaciones"
  add_foreign_key "eventos", "tipo_eventos"
  add_foreign_key "eventos", "ubicaciones"
  add_foreign_key "eventualidades", "motivos"
  add_foreign_key "eventualidades", "tipo_eventualidades"
  add_foreign_key "formacion_academicas", "nivel_formaciones"
  add_foreign_key "grupo_sanguineo_perfiles", "grupo_sanguineos"
  add_foreign_key "grupo_sanguineo_perfiles", "perfiles"
  add_foreign_key "habito_perfiles", "habitos"
  add_foreign_key "habito_perfiles", "perfiles"
  add_foreign_key "habito_personas", "habitos"
  add_foreign_key "habito_personas", "personas"
  add_foreign_key "habitos", "tipo_habitos"
  add_foreign_key "historial_citas", "citas"
  add_foreign_key "horarios", "servicios"
  add_foreign_key "horarios", "tipo_horarios"
  add_foreign_key "lesion_perfiles", "lesiones"
  add_foreign_key "lesion_perfiles", "perfiles"
  add_foreign_key "lesion_personas", "lesiones"
  add_foreign_key "lesion_personas", "personas"
  add_foreign_key "lesiones", "tipo_lesiones"
  add_foreign_key "motivos", "tipo_motivos"
  add_foreign_key "noticias", "tipo_noticias"
  add_foreign_key "notificaciones", "tipo_notificaciones"
  add_foreign_key "notificaciones", "usuarios"
  add_foreign_key "ocupacion_perfiles", "ocupaciones"
  add_foreign_key "ocupacion_perfiles", "perfiles"
  add_foreign_key "ocupacion_personas", "ocupaciones"
  add_foreign_key "ocupacion_personas", "personas"
  add_foreign_key "opiniones", "motivos"
  add_foreign_key "opiniones", "tipo_opiniones"
  add_foreign_key "option_roles", "option_menus"
  add_foreign_key "option_roles", "roles"
  add_foreign_key "parentescos", "personas"
  add_foreign_key "parentescos", "tipo_parentescos"
  add_foreign_key "patologia_perfiles", "patologias"
  add_foreign_key "patologia_perfiles", "perfiles"
  add_foreign_key "patologia_personas", "patologias"
  add_foreign_key "patologia_personas", "personas"
  add_foreign_key "patologias", "tipo_patologias"
  add_foreign_key "perfil_tipo_servicios", "perfiles"
  add_foreign_key "perfil_tipo_servicios", "tipo_servicios"
  add_foreign_key "perfil_vacunas", "perfiles"
  add_foreign_key "perfil_vacunas", "vacunas"
  add_foreign_key "persona_profesiones", "personas"
  add_foreign_key "persona_profesiones", "profesiones"
  add_foreign_key "persona_vacunas", "personas"
  add_foreign_key "persona_vacunas", "vacunas"
  add_foreign_key "personas", "estado_civiles"
  add_foreign_key "personas", "grupo_sanguineos"
  add_foreign_key "personas", "referencias"
  add_foreign_key "personas", "sexos"
  add_foreign_key "preguntas", "tipo_preguntas"
  add_foreign_key "profesion_perfiles", "perfiles"
  add_foreign_key "profesion_perfiles", "profesiones"
  add_foreign_key "rango_edad_perfiles", "perfiles"
  add_foreign_key "rango_edad_perfiles", "rango_edades"
  add_foreign_key "rango_peso_perfiles", "perfiles"
  add_foreign_key "rango_peso_perfiles", "rango_pesos"
  add_foreign_key "servicios", "especialistas"
  add_foreign_key "servicios", "tipo_servicios"
  add_foreign_key "servicios", "ubicaciones"
  add_foreign_key "sexo_perfiles", "perfiles"
  add_foreign_key "sexo_perfiles", "sexos"
  add_foreign_key "suscriptores", "personas"
  add_foreign_key "tipo_servicio_eventos", "eventos"
  add_foreign_key "tipo_servicio_eventos", "tipo_servicios"
  add_foreign_key "tipo_servicios", "categorias"
  add_foreign_key "tipo_servicios", "especialidades"
  add_foreign_key "tipo_servicios", "tipo_atenciones"
  add_foreign_key "turnos", "dias"
  add_foreign_key "turnos", "horarios"
  add_foreign_key "turnos", "tipo_turnos"
  add_foreign_key "ubicaciones", "ciudades"
  add_foreign_key "ubicaciones", "sectores"
  add_foreign_key "ubicaciones", "tipo_ubicaciones"
  add_foreign_key "usuarios", "personas"
  add_foreign_key "usuarios", "roles"
  add_foreign_key "usuarios", "servicios"
end
