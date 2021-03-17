class UserWantBudgetsController < ApplicationController

  def new
    @user_want_budget = UserWantBudget.new
  end

  def create
    @user_want_budget = UserWantBudget.new(user_want_budget_params)
    if @user_want_budget.save
    else
      render :new
    end
  end

  private
  def user_want_budget_params
    params.require(:user_want_budget).permit(:will, :budget, :yen_per_hour).merge(user_id: current_user.id)
  end

end
