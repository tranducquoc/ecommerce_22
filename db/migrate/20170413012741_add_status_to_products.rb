class AddStatusToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :status, :integer, default: 0
  end
end
