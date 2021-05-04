class CreateUserSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :user_skills do |t|
      t.references :user, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true
      t.integer :experience_year, null: false, default: 0
      t.integer :level, null: false, default: 1

      t.timestamps
    end
    add_index :user_skills, [:skill_id, :user_id], unique: true
  end
end