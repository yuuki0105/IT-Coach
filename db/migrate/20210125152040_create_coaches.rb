class CreateCoaches < ActiveRecord::Migration[6.1]
  def change
    create_table :coaches do |t|

      t.references :user, null: false, foreign_key: true
      t.boolean :schedule_confirmed, null: false, default: false
      t.integer :examination_status_id, null: false, default: 1
      t.date :examination_result_date, comment: '審査結果日'

      t.timestamps
    end
  end
end
