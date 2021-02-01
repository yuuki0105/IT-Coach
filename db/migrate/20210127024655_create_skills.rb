class CreateSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :skills do |t|
      t.references :skill_category, null: false, foreign_key: true
      t.string :name, null: false, comment: 'スキル名'
      t.string :en_name, null: false, comment: '英語スキル名'
      t.boolean :published, null: false, default: true, comment: '公開非公開'

      t.timestamps
    end
  end
end
