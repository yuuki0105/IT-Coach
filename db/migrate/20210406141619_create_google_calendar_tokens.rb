class CreateGoogleCalendarTokens < ActiveRecord::Migration[6.1]
  def change
    create_table :google_calendar_tokens do |t|
      t.references :coach, null: false, foreign_key: true
      t.string :access_token, null: false

      t.timestamps
    end
  end
end
