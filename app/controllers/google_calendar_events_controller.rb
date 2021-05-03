class GoogleCalendarEventsController < ApplicationController
  include AuthenticateUser

  def new
    oauth = GoogleOauthApi.new
    redirect_to oauth.client.authorization_uri.to_s
  end

  def show
    coach = current_user.coach
    oauth = GoogleOauthApi.new
    oauth.client.code = params[:code]
    oauth.client.fetch_access_token! # Refresh Token

    ActiveRecord::Base.transaction do
      google_calendar_token = GoogleCalendarToken.find_or_initialize_by(coach: current_user.coach)
      google_calendar_token.refresh_token = oauth.client.refresh_token
      google_calendar_token.save
      # TODO: いずれ複数カレンダーにも対応するように作る
      api_client = coach.google_calendar_api_client
      primary_calendar = api_client.get_calendar("primary")
      calendar = GoogleCalendar.find_or_create_by(coach: coach, calendar_id: primary_calendar.id)
    end

    if coach.before_examination? && !coach.registration_complete?
      redirect_to registrations_examination_interview_date_path, notice: "Google Calendar連携が完了しました"
    else
      redirect_to coach_path(coach)
    end
  end
end
