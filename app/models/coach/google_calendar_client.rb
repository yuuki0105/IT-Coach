class Coach < ApplicationRecord
  module GoogleCalendarClient
    extend ActiveSupport::Concern

    FROM_LIST_EVENTS_DIFF_DATE = 90.days

    included do
      def google_calendar_api_client
        oauth = GoogleOauthApi.new
        oauth.client.refresh_token = self.refresh_token
        oauth.client.fetch_access_token!

        service = Google::Apis::CalendarV3::CalendarService.new
        service.authorization = oauth.client
        service
      end
    end
  end
end