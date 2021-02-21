class SearchesController < ApplicationController

  def show
    @coaches = Coach.search(params[:keyword])
  end

end
