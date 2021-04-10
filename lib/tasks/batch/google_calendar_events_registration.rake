namespace :batch do
  # bundle exec rake batch:google_calendar_events_registration
  desc "googleカレンダーから予定を取得してscheduled_eventsテーブルに入れる"

  task google_calendar_events_registration: :environment do
    google_calendar_tokens = GoogleCalendarToken.all
    client = Signet::OAuth2::Client.new(client_options)
    now = Time.current.rfc3339
    google_calendar_tokens.each do |token|
      coach = token.coach
      client.refresh_token = token.refresh_token
      client.fetch_access_token! #アクセストークンを生成
      service = Google::Apis::CalendarV3::CalendarService.new
      service.authorization = client
      response = service.list_events("primary", time_max: now+6.months, single_events: true ,order_by: "startTime", time_min: now)
      response.items.each do|item|
        event = ScheduledEvent.find_or_initialize_by(coach: coach,google_calendar_event_id: item.id)
        event.start_time = item.start.date_time || item.start.date
        event.end_time = item.end.date_time || item.end.date
        event.save
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