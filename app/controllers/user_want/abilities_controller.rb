class UserWant::AbilitiesController < ApplicationController
  include AuthenticateUser

  def new
    @user_want_ability = UserWantAbility.new
  end

  def create
    @user_want_ability = UserWantAbility.new(user_want_ability_params)
    if @user_want_ability.save
      redirect_to new_user_want_budget_path
    else
      render :new
    end
  end

  private

  def user_want_ability_params
    params.require(:user_want_ability).permit(:technology_degree_id, :communication_degree_id).merge(user_id: current_user.id)
  end
end
