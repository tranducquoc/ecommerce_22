class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :address
      t.string :phone
      t.text :note
      t.integer :status, default: 1
      t.datetime :delivery_day
      t.integer :discount, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :orders, [:user_id, :created_at]
  end
end
