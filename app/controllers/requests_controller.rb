class RequestsController < ApplicationController
  def new
    @painting = Painting.find(params[:painting_id])
    @request = Request.new
  end

  def create
    @painting = Painting.find(params[:painting_id])
    @request = Request.new
    @request.painting = @painting
    @request.user = current_user
    if @request.save
      redirect_to request_path(@request)
    else
      render :new
    end
  end

  def show
    @request = Request.find(params[:id])
  end

  def update
    @request = Request.find(params[:id])
  end

  def incoming
  end

  def outgoing
  end

  private

  def request_params
    params.require(:request).permit(:start_date, :end_date)
  end
end
