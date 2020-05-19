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
    new_painting = Painting.new(painting_params)
    if new_painting.save
      redirect_to painting_path(new_painting)
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
  end

  def delete

  end

  private

  def painting_params
    params.require(:painting).permit(:name, :painter, :category, :location, :dimensions, :price_per_day)
  end
end
