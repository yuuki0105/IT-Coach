class UserWant::BudgetsController < ApplicationController
  include AuthenticateUser

  def new
    @user_want_budget = UserWantBudget.new
    @want_budgets = WantBudget.all
    @want_yen_per_hours = WantYenPerHour.all
  end

  def create
    @user_want_budget = UserWantBudget.new(user_want_budget_params)
    if @user_want_budget.save
      redirect_to new_user_want_free_path
    else
      render :new
    end
  end

  private
  def user_want_budget_params
    params.require(:user_want_budget).permit(:will, :want_budget_id, :want_yen_per_hour_id).merge(user_id: current_user.id)
  end
end
