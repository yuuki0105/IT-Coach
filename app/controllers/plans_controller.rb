class PlansController < ApplicationController

  def new
    @plan = Plan.new
    #↑空っぽの変数をつくっている
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to coach_path(@plan.coach)
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
      redirect_to coach_path(@plan.coach)
    else
      render :edit
    end
  end

  private
  def plan_params
    params.require(:plan).permit(:title, :term, :communication_style, :fee, :target, :content, :published).merge(coach_id: current_user.coach.id)
  end

end