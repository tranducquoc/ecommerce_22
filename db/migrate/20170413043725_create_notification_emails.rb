class CreateNotificationEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :notification_emails do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.boolean :is_sended, default: false

      t.timestamps
    end
  end
end
