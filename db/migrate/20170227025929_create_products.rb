class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :info
      t.integer :price
      t.string :image
      t.references :categorie, foreign_key: true

      t.timestamps
    end
  end
end
