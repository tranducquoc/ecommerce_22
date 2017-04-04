class AddNoteToCarts < ActiveRecord::Migration[5.0]
  def change
    add_column :carts, :note, :string
  end
end
