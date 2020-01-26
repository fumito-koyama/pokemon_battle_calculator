class CreateTables < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.integer :number, null: false
      t.string :name, index: true, null: false
      t.integer :updated_generation, null: false
      t.string :form
      t.string :evolutions
      t.string :types, null: false
      t.string :abilities#, null: false
      t.string :hidden_abilities
      t.integer :hp, null: false
      t.integer :attack, null: false
      t.integer :defence, null: false
      t.integer :sp_attack, null: false
      t.integer :sp_defence, null: false
      t.integer :speed, null: false
    end
  end
end
