class Coaches::AbilitiesController < ApplicationController
  include AuthenticateUser

  def new
    @ability = Ability.new
  end

  def create
    @ability = Ability.new(ability_params)
    if @ability.save
      redirect_to mypage_path
    else
      render :new
    end
  end

  def edit
    @ability = current_user.coach.abilities.find(params[:id])
  end

  def update
    @ability = current_user.coach.abilities.find(params[:id])
    if @ability.update(ability_params)
      redirect_to mypage_path
    else
      render :edit
    end
  end

  def destroy
    @ability = current_user.coach.abilities.find(params[:id])
    if @ability.destroy
      redirect_to mypage_path
    else
      flash[:error] = "削除に失敗しました"
      render :edit
    end
  end

  private
  def ability_params
    params.require(:ability).permit(:content).merge(coach_id: current_user.coach.id)
  end
end