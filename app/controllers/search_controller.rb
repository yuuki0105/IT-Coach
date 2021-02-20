class SearchController < ApplicationController

  def index
    @coaches = Coach.search(params[:keyword])
  end

end
