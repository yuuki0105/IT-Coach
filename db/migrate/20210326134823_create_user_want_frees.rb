class CreateUserWantFrees < ActiveRecord::Migration[6.1]
  def change
    create_table :user_want_frees do |t|
      t.references :user, null: false, foreign_key: true
      t.string :content, null: false

      t.timestamps
    end
  end
end
