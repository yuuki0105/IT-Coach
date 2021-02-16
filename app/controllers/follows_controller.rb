class FollowsController < ApplicationController

  def index
    @follows = current_user.follows
  end

end
