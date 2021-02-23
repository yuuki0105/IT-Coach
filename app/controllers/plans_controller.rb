class PlansController < ApplicationController

  include AuthenticateUser

  def new
    @plan = Plan.new
    #↑空っぽの変数をつくっている
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to mypage_path
    else
      render :new
    end
  end

  def edit
    @plan = current_user.coach.plans.find(params[:id])
  end

  def update
    @plan = current_user.coach.plans.find(params[:id])
    if @plan.update(plan_params)
      redirect_to mypage_path
    else
      render :edit
    end
  end

  private
  def plan_params
    params.require(:plan).permit(:title, :term_id, :communication_style_id, :fee, :target, :content, :published).merge(coach_id: current_user.coach.id)
  end

end
