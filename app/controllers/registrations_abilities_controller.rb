class RegistrationsAbilitiesController < ApplicationController

  include AuthenticateUser

  def new
    @coach = current_user.coach
    @coach.abilities.build
    @ability = Ability.new
  end

  def create
    @coach = current_user.coach
    if @coach.update(ability_params)
      redirect_to new_coach_registrations_ability_path(@coach)
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
    params.require(:coach).permit(abilities_attributes: [:content])
  end

end
