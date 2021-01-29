class CreateSkillCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :skill_categories do |t|
      t.string :name, null: false
      t.string :en_name, null: false

      t.timestamps
    end
  end
end
