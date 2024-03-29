class UserFollowsController < ApplicationController
  include AuthenticateUser

  def index
    @follows = current_user.follows
  end

  def create
    @user = User.find(user_follow_params[:follow_id])
    current_user.follow(@user)
    redirect_to coach_path(id: @user.coach.id)
    # @userはフォローされたユーザーのこと
  end

  def destroy
    @user = User.find(user_follow_params[:follow_id])
    current_user.unfollow(@user)
    redirect_to coach_path(id: @user.coach.id)
  end

  private

  def user_follow_params
    params.require(:user_follow).permit(:follow_id)
  end
end
