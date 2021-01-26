class AddForeignKeyToSnsAccounts < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :sns_accounts, :users
  end
end