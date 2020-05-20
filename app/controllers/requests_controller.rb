class RequestsController < ApplicationController
  def new
    @painting = Painting.find(params[:painting_id])
    @request = Request.new
  end

  def create
    @painting = Painting.find(params[:painting_id])
    @request = Request.new(request_params)
    @request.status = "Pending..."
    @request.painting = @painting
    @request.user = current_user
    if @request.save
      redirect_to request_path(@request)
    else
      render :new
    end
  end

  def update
    @request = Request.find(params[:id])
    # TO DO !!!
    # make a button that returns the new status ie: Accepted, declined
  end

  def incoming
    paintings = current_user.paintings
    array = paintings.map { |painting| painting.requests }
    @requests = array[0]
  end

  def outgoing
    @requests = Request.where(user: current_user)
  end

  def show
    @request = Request.find(params[:id])
  end

  private

  def request_params
    params.require(:request).permit(:start_date, :end_date)
  end
end
