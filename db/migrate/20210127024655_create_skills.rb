class CreateSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :skills do |t|
      t.string :name, null: false, comment: 'スキル名'
      t.boolean :published, null: false, default: true, comment: '公開非公開'
      t.references :skill_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
