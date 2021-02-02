class PlansController < ApplicationController

  def new
    @plan = Plan.new
    #↑空っぽの変数をつくっている
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to coach_path
      #ここのリダイレクト先は後から変更予定
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  private
  def plan_params
    params.require(:plan).permit(:title).merge(coach_id: params[:coach_id])
  end

end