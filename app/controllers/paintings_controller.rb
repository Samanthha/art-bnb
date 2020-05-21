class PaintingsController < ApplicationController
  def index
    @paintings = Painting.all
  end

  def show
    @painting = Painting.find(params[:id])
  end

  def new
    @painting = Painting.new
  end

  def create
    @painting = Painting.new(painting_params)
    @painting.user = current_user
    if @painting.save
      flash[:notice] = "You have successfully added a painting."
      redirect_to painting_path(@painting)
    else
      render :new
    end
  end

  def edit
    @painting = Painting.find(params[:id])
  end

  def update
    @painting = Painting.find(params[:id])
    @painting.update(painting_params)

    redirect_to painting_path(@painting)
  end

  def destroy
    @painting = Painting.find(params[:id])
    @painting.destroy
    redirect_to paintings_path
  end

  def delete
    @paintings = Painting.all
    @painting = Painting.find(params[:id])
  end

  private

  def painting_params
    params.require(:painting).permit(:photo, :name, :painter, :category, :location, :dimensions, :price_per_day)
  end
end
