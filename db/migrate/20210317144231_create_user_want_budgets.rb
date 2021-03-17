class CreateUserWantBudgets < ActiveRecord::Migration[6.1]
  def change
    create_table :user_want_budgets do |t|
      t.references :user, null: false, foreign_key: true
      t.string :will, null: false
      t.integer :budget, null: false
      t.integer :yen_per_hour, null: false

      t.timestamps
    end
  end
end
