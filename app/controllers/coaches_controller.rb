class CoachesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def show
    @coach = Coach.find(params[:id])
    @user = @coach.user
  end

  def index
    @coaches = Coach.all
  end

  def create
    coach = Coach.new(user: current_user)
    if coach.save
      redirect_to mypage_path
    else
      redirect_to about_coach_path
    end
  end
end
