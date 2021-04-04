class MypagesController < ApplicationController

  include AuthenticateUser

  def show
    @user = current_user
    @coach = @user.coach

    client = Signet::OAuth2::Client.new(client_options)
    client.update!(session[:authorization])
    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client
    calendar_id = "primary"
    @events = service.list_events(calendar_id, max_results: 10, single_events: true ,order_by: "startTime", time_min: Time.current.rfc3339)
    binding.pry

  end

  private
  def client_options
    {
      client_id: Rails.application.credentials.google_calendar[:client_id],
      client_secret: Rails.application.credentials.google_calendar[:client_secret],
      authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
      token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
      scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
      redirect_uri: "http://localhost:3000/google_calendar_events"
    }
  end

end
