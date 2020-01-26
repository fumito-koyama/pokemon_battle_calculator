# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_20_100412) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pokemons", force: :cascade do |t|
    t.integer "number", null: false
    t.string "name", null: false
    t.integer "updated_generation", null: false
    t.string "form"
    t.string "evolutions"
    t.string "types", null: false
    t.string "abilities"
    t.string "hidden_abilities"
    t.integer "hp", null: false
    t.integer "attack", null: false
    t.integer "defence", null: false
    t.integer "sp_attack", null: false
    t.integer "sp_defence", null: false
    t.integer "speed", null: false
    t.index ["name"], name: "index_pokemons_on_name"
  end

end
