class MypagesController < ApplicationController
  include AuthenticateUser

  def show
    @user = current_user
    @coach = @user.coach
  end
end
