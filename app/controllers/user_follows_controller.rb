class UserFollowsController < ApplicationController

  def index
    @follows = current_user.follows
  end

  def create
  end

end
