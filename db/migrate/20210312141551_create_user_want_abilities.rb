class CreateUserWantAbilities < ActiveRecord::Migration[6.1]
  def change
    create_table :user_want_abilities do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :technology_id, null: false
      t.integer :communication_id, null: false

      t.timestamps
    end
  end
end
