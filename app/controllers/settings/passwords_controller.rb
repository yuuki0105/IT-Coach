class Settings::PasswordsController < ApplicationController

  def edit
    @user = current_user
  end

end
