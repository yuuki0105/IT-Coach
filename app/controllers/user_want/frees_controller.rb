class UserWant::FreesController < ApplicationController

  include AuthenticateUser

  def new
    @user_want_free = UserWantFree.new
  end

  def create
    @user_want_free = UserWantFree.new(user_want_free_params)
    if @user_want_free.save
      flash[:success] = "登録が完了しました"
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def user_want_free_params
    params.require(:user_want_free).permit(:content).merge(user_id: current_user.id)
  end

end
