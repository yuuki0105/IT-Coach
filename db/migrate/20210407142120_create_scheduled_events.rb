class CreateScheduledEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :scheduled_events do |t|
      t.references :coach, null: false, foreign_key: true
      t.references :google_calendar, null: false, foreign_key: true
      t.string :google_calendar_event_id, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false

      t.timestamps
    end
    add_index :scheduled_events, [:google_calendar_event_id, :google_calendar_id], unique: true, name: "google_calendar_event_id_index"
  end
end
