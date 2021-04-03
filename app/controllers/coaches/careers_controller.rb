class Coaches::CareersController < ApplicationController

  include AuthenticateUser

  def new
    @career = Career.new
  end

  def create
    @career = Career.new(career_params)
    if @career.save
      redirect_to mypage_path
    else
      render :new
    end
  end

  def edit
    @career = current_user.coach.careers.find(params[:id])
  end

  def update
    @career = current_user.coach.careers.find(params[:id])
    if @career.update(career_params)
      redirect_to mypage_path
    else
      render :edit
    end
  end

  def destroy
    @career = current_user.coach.careers.find(params[:id])
    if @career.destroy
      redirect_to mypage_path
    else
      flash[:error] = "削除に失敗しました"
      render :edit
    end
  end

  private
  def career_params
    params.require(:career).permit(:organization, :role, :start_month, :end_month, :ongoing).merge(coach_id: current_user.coach.id)
  end

end
