class CreateYenPerHours < ActiveRecord::Migration[6.1]
  def change
    create_table :yen_per_hours do |t|

      t.references :coach, null: false, foreign_key: true
      t.integer :price, null: false, default: 0

      t.timestamps
    end
  end
end
