class CreateAbilities < ActiveRecord::Migration[6.1]
  def change
    create_table :abilities do |t|

      t.references :coach, null: false, foreign_key: true
      t.string  :content, null: false, default:""

      t.timestamps
    end
  end
end
