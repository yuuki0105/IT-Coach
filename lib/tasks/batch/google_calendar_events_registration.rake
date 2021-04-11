namespace :batch do
  # bundle exec rake batch:google_calendar_events_registration
  desc "googleカレンダーから予定を取得してscheduled_eventsテーブルに入れる"

  task google_calendar_events_registration: :environment do
    google_calendar_tokens = GoogleCalendarToken.all
    client = Signet::OAuth2::Client.new(client_options)
    now = Time.current

    google_calendar_tokens.each do |token|
      coach = token.coach
      client.refresh_token = token.refresh_token
      client.fetch_access_token! #アクセストークンを生成

      service = Google::Apis::CalendarV3::CalendarService.new
      service.authorization = client
      primary_calendar = service.get_calendar("primary")
      calendar = GoogleCalendar.find_or_create_by(coach: coach, calendar_id: primary_calendar.id)

      response = service.list_events(calendar.calendar_id, single_events: true, time_min: now.rfc3339, time_max: (now + 3.months).rfc3339)

      events = response.items.map do |item|
        {
          coach_id: coach.id,
          google_calendar_event_id: item.id,
          google_calendar_id: calendar.id,
          start_time: item.start.date_time || item.start.date,
          end_time: item.end.date_time || item.end.date
        }
      end

      ActiveRecord::Base.transaction do
        ScheduledEvent.import(events, on_duplicate_key_ignore: true)
        calendar.update(next_sync_token: response.next_sync_token)
      end

    end

  end

end

def client_options
  {
    client_id: Rails.application.credentials.google_calendar[:client_id],
    client_secret: Rails.application.credentials.google_calendar[:client_secret],
    authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
    token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
    scope: Google::Apis::CalendarV3::AUTH_CALENDAR_EVENTS,
    redirect_uri: "http://localhost:3000/google_calendar_events"
  }
end