class CreateCoaches < ActiveRecord::Migration[6.1]
  def change
    create_table :coaches do |t|

      t.references :user, null: false, foreign_key: true
      t.boolean :examination_interview_date_confirmed, null: false, default: false, comment: '審査面談日程の確定'
      t.integer :examination_status_id, null: false, default: 1
      t.date :examination_result_date, comment: '審査結果日'

      t.timestamps
    end
  end
end
