class GoogleCalendar < ApplicationRecord
  module Client
    extend ActiveSupport::Concern

    FROM_LIST_EVENTS_DIFF_DATE = 90.days

    def list_events_in_term(from: Time.current, to: Time.current + FROM_LIST_EVENTS_DIFF_DATE, single_events: true)
      api_client.list_events(calendar_id, single_events: single_events, time_min: from.rfc3339, time_max: to.rfc3339)
    end

    def list_events_next_page(page_token: nil)
      api_client.list_events(calendar_id, page_token: page_token)
    end

    def list_events_next_token
      api_client.list_events(calendar_id, sync_token: next_sync_token)
    end

    private

    def api_client
      coach.google_calendar_api_client
    end
  end
end
