class CreateSnsAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :sns_accounts do |t|

      t.string :provider, null: false
      t.string :uid, null: false
      t.references :user, null: false, forign_key: true

      t.timestamps
    end
  end
end
