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

ActiveRecord::Schema.define(version: 2019_07_04_135744) do

  create_table "amizades", force: :cascade do |t|
    t.integer "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_amizades_on_usuario_id"
  end

  create_table "curtirs", force: :cascade do |t|
    t.integer "postagem_id"
    t.integer "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["postagem_id"], name: "index_curtirs_on_postagem_id"
    t.index ["usuario_id"], name: "index_curtirs_on_usuario_id"
  end

  create_table "postagems", force: :cascade do |t|
    t.string "mensagem"
    t.integer "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "imagem_file_name"
    t.string "imagem_content_type"
    t.integer "imagem_file_size"
    t.datetime "imagem_updated_at"
    t.index ["usuario_id"], name: "index_postagems_on_usuario_id"
  end

  create_table "solicitacaos", force: :cascade do |t|
    t.integer "usuario_id"
    t.integer "solicitado_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome", null: false
    t.string "username", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "foto_file_name"
    t.string "foto_content_type"
    t.integer "foto_file_size"
    t.datetime "foto_updated_at"
  end

end
