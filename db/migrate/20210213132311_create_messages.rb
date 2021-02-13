class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :coach, null: false, foreign_key: true
      t.text  :message, null: false
      t.boolean   :read,       null: false,    default: false, comment: '既読/未読'
      t.timestamps
    end
  end
end
