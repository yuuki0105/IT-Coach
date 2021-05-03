namespace :batch do
  namespace :google_calendar do
    # bundle exec rake batch:google_calendar:events_update
    desc "googleカレンダーで変更された予定をscheduled_eventsテーブルでアップデートする"
    task events_update: :environment do
      calendars = GoogleCalendar.where.not(next_sync_token: nil)

      calendars.each do |calendar|
        coach = calendar.coach
        response = calendar.list_events_next_token
        items = response.items
        next_sync_token = response.next_sync_token
        events = events_format(items,coach.id, calendar.id)
        ActiveRecord::Base.transaction do
          events.each do |event|
            #TODO: 時間変更以外の変更も取得してしまうが、後々直したい
            find_event = ScheduledEvent.find_by(google_calendar_id: calendar.id, google_calendar_event_id: event[:google_calendar_event_id])
            find_event.update(start_time: event[:start_time], end_time: event[:end_time])
          end
          calendar.update(next_sync_token: next_sync_token)
        end
      end
    end
  end
end
