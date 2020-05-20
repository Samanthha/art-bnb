class PagesController < ApplicationController
  def home
    redirect_to paintings_path
  end

  def profile
    @user = current_user
    @paintings = Painting.where(user: current_user)
  end
end
