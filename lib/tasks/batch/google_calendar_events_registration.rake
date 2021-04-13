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
      calendar = coach.google_calendar
      response = service.list_events(calendar.calendar_id, single_events: true, time_min: now.rfc3339, time_max: (now + 12.months).rfc3339)

      items = response.items

      if response.next_page_token
        items = next_page_request(service, calendar, response, items, 1)
      end
      confirmed_items = items.select{|item| item.status == "confirmed"}

      events = confirmed_items.map do |item|
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
        # calendar.update(next_sync_token: response.next_sync_token)
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

def next_page_request(service, calendar, response, items, repeat_count)
  repeat_count = repeat_count+1
  next_response = service.list_events(calendar.calendar_id, page_token: response.next_page_token)
  items.concat(next_response.items)
  return items if next_response.next_page_token.nil?
  return items if repeat_count > 10
  next_page_request(service, calendar, next_response, items, repeat_count) if next_response.next_page_token
end