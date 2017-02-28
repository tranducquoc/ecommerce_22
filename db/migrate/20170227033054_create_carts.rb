class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.integer :quantity, default: 1 
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
      add_index :orders, [:user_id, :product_id]
  end
end
