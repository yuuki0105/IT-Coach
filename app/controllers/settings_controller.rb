class SettingsController < ApplicationController

  include AuthenticateUser

  def show
    @user = current_user
  end

end