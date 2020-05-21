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
    # if status one of a/d/c
    if ["Accepted", "Declined", "Cancelled"].include?(status_params[:status])
      @request.status = status_params[:status]
      @request.save!
    # else 
      # display error message
    end
    redirect_to incoming_requests_path
  end

  def incoming
    paintings = current_user.paintings
    array = paintings.map { |painting| painting.requests }
    @requests = array.flatten
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

  def status_params
    params.require(:request).permit(:status)
  end
end
