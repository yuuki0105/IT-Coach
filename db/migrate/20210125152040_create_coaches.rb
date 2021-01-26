class CreateCoaches < ActiveRecord::Migration[6.1]
  def change
    create_table :coaches do |t|

      t.references :user, null: false, foreign_key: true
      t.boolean :schedule_confirmed, null: false, default: false
      t.integer :examination_status, null: false, default: 0

      t.timestamps
    end
  end
end
