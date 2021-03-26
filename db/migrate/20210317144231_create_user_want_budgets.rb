class CreateUserWantBudgets < ActiveRecord::Migration[6.1]
  def change
    create_table :user_want_budgets do |t|
      t.references :user, null: false, foreign_key: true
      t.string :will, null: false
      t.integer :want_budget_id, null: false
      t.integer :want_yen_per_hour_id, null: false

      t.timestamps
    end
  end
end
