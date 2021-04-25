class MenusController < ApplicationController
  include AuthenticateUser

  def show
    @user = current_user
  end
end
