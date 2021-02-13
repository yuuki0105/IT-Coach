class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :send_user, null: false, foreign_key: {to_table: :users}, comment: '送信ユーザー'
      t.references :receive_user, null: false, foreign_key: {to_table: :users}, comment: '受信ユーザー'
      t.text  :content, null: false
      t.boolean   :read,       null: false,    default: false, comment: '既読/未読'
      t.timestamps
    end
  end
end
