class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|

      t.references :user, null: false, foreign_key: true
      t.references :other_user, null: false, foreign_key: {to_table: :users}, comment: 'もう一人のユーザー'

      t.timestamps
    end
  end
end
