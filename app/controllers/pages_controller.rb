class PagesController < ApplicationController
  def home
    redirect_to paintings_path
  end

  def profile
  end
end
