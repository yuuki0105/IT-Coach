class GoogleCalendarEventsController < ApplicationController

  include AuthenticateUser

  def new
    client = Signet::OAuth2::Client.new(client_options)
    redirect_to client.authorization_uri.to_s
  end

  def show

    client = Signet::OAuth2::Client.new(client_options)
    client.code = params[:code]
    client.fetch_access_token! # Refresh Token

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client

    google_calendar_token = GoogleCalendarToken.find_or_initialize_by(coach: current_user.coach)
    google_calendar_token.refresh_token = client.refresh_token
    google_calendar_token.save

    if current_user.coach.before_examination? && !current_user.coach.registration_complete?
      redirect_to registrations_examination_interview_date_path
    else
      redirect_to coach_path(current_user.coach)
    end

  end

  private
  def client_options
    {
      client_id: Rails.application.credentials.google_calendar[:client_id],
      client_secret: Rails.application.credentials.google_calendar[:client_secret],
      authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
      token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
      scope: [Google::Apis::CalendarV3::AUTH_CALENDAR_SETTINGS_READONLY,Google::Apis::CalendarV3::AUTH_CALENDAR_EVENTS],
      redirect_uri: "http://localhost:3000/google_calendar_events"
    }
  end

end
