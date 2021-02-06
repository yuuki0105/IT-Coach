class CreatePortfolios < ActiveRecord::Migration[6.1]
  def change
    create_table :portfolios do |t|
      t.references :coach, null: false, foreign_key: true
      t.string   :title,          null: false
      t.string   :url

      t.timestamps
    end
  end
end
