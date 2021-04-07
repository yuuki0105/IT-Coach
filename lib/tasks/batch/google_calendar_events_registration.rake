namespace :batch do
  # bundle exec rake batch:google_calendar_events_registration
  desc "googleカレンダーから予定を取得してscheduled_eventsテーブルに入れる"

  task google_calendar_events_registration: :environment do
    google_calendar_tokens = GoogleCalendarToken.all
    client = Signet::OAuth2::Client.new(client_options)
    google_calendar_tokens.each do |token|
      coach = token.coach
      # TODO:エラー有り・まだ動かない（やり方を模索中）
      client.update!(token.access_token)
      service = Google::Apis::CalendarV3::CalendarService.new
      service.authorization = client
      response = service.list_events(calendar_id, max_results: 10, single_events: true ,order_by: "startTime", time_min: Time.current.rfc3339)
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