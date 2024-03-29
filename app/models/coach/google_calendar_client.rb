class Coach < ApplicationRecord
  module GoogleCalendarClient
    extend ActiveSupport::Concern

    included do
      def google_calendar_api_client
        oauth = GoogleOauthApi.new
        oauth.client.refresh_token = refresh_token
        oauth.client.fetch_access_token!

        service = Google::Apis::CalendarV3::CalendarService.new
        service.authorization = oauth.client
        service
      end
    end
  end
end
