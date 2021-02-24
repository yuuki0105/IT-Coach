class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :message, foreign_key: true

      t.boolean :read,  null: false,  default: false, comment: '既読/未読'
      t.integer :notification_type_id,  null: false

      t.timestamps
    end
  end
end
