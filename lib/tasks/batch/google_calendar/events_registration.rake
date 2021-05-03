namespace :batch do
  namespace :google_calendar do
    # bundle exec rake batch:google_calendar:events_registration
    desc "googleカレンダーから予定を取得してscheduled_eventsテーブルに入れる"
    task events_registration: :environment do
      google_calendar_tokens = GoogleCalendarToken.all
      now = Time.current

      google_calendar_tokens.each do |token|
        coach = token.coach
        calendar = coach.google_calendar
        response = calendar.list_events_in_term(from: now, to: now + 3.months)

        items = response.items
        next_sync_token = response.next_sync_token
        repeat_count = 1

        while response.next_page_token && repeat_count <= 10
          repeat_count += 1
          response = calendar.list_events_next_page(page_token: response.next_page_token)
          items.concat(response.items)
        end

        confirmed_items = items.select{ |item| item.status == "confirmed" }

        events = events_format(confirmed_items, coach.id, calendar.id)

        ActiveRecord::Base.transaction do
          ScheduledEvent.import(events, on_duplicate_key_ignore: true)
          calendar.update(next_sync_token: next_sync_token)
        end
      end
    end

    def events_format(items, coach_id, calendar_id)
      items.map do |item|
        {
          coach_id: coach_id,
          google_calendar_event_id: item.id,
          google_calendar_id: calendar_id,
          start_time: item.start.date_time || item.start.date,
          end_time: item.end.date_time || item.end.date
        }
      end
    end
  end
end
