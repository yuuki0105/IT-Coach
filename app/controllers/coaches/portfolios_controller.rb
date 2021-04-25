class Coaches::PortfoliosController < ApplicationController
  include AuthenticateUser

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    if @portfolio.save
      redirect_to mypage_path
    else
      render :new
    end
  end

  def edit
    @portfolio = current_user.coach.portfolios.find(params[:id])
  end

  def update
    @portfolio = current_user.coach.portfolios.find(params[:id])
    if @portfolio.update(portfolio_params)
      redirect_to mypage_path
    else
      render :edit
    end
  end

  def destroy
    @portfolio = current_user.coach.portfolios.find(params[:id])
    if @portfolio.destroy
      redirect_to mypage_path
    else
      flash[:error] = "削除に失敗しました"
      render :edit
    end
  end

  private
  def portfolio_params
    params.require(:portfolio).permit(:title, :url).merge(coach_id: current_user.coach.id)
  end
end
