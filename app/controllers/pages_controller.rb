class PagesController < ApplicationController
  skip_after_action :verify_authorized

  def profile
    @user = current_user
    @paintings = Painting.where(user: current_user)
    @current_requests = Request.where(painting: @user.paintings)
  end
  
end
