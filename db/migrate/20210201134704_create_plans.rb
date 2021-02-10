class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|

      t.references :coach, null: false, foreign_key: true
      t.string   :title,          null: false
      t.integer   :term_id,          null: false
      t.integer   :communication_style_id,          null: false
      t.integer   :fee,          null: false
      t.string   :target,          null: false
      t.text   :content,          null: false
      t.boolean   :published,       null: false,    default: true
      t.boolean   :deleted,       null: false,    default: false

      t.timestamps

    end
  end
end
