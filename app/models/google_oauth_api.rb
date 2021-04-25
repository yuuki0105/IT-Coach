class GoogleOauthApi
  include ActiveModel::Model
  include ActiveModel::Attributes

  attr_accessor :client, :refresh_token, :code, :access_token

  def initialize
    self.client = Signet::OAuth2::Client.new(client_options)
  end

  private

  def client_options
    {
      client_id: Rails.application.credentials.google_calendar[:client_id],
      client_secret: Rails.application.credentials.google_calendar[:client_secret],
      authorization_uri: "https://accounts.google.com/o/oauth2/auth",
      token_credential_uri: "https://accounts.google.com/o/oauth2/token",
      scope: [Google::Apis::CalendarV3::AUTH_CALENDAR],
      redirect_uri: "http://localhost:3000/google_calendar_events"
    }
  end
end