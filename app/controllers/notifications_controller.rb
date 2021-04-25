class NotificationsController < ApplicationController
  include AuthenticateUser

  def index
    @notifications = current_user.notifications.order(created_at: :desc)
  end
end
