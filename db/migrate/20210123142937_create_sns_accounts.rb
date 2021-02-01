class CreateSnsAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :sns_accounts do |t|

      t.references :user, null: false, foreign_key: true
      t.string :provider, null: false
      t.string :uid, null: false

      t.timestamps
    end
  end
end
