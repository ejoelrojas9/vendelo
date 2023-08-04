class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end

    add_index :favorites, [:user_id, :product_id], unique: true   # Evita que un usuario le guste el mismo producto varias veces creando un indice unico
  end
end
