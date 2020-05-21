class PaintingsController < ApplicationController
  before_action :set_painting, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR painter ILIKE :query"
      @paintings = Painting.where(sql_query, query: "%#{params[:query]}%")
    else
      @paintings = Painting.all
    end
  end

  def show
  end

  def new
    @painting = Painting.new
    authorize @painting
  end

  def create
    @painting = Painting.new(painting_params)
    authorize @painting
    @painting.user = current_user
    if @painting.save
      flash[:notice] = "You have successfully added a painting."
      redirect_to painting_path(@painting)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @painting.update(painting_params)

    redirect_to painting_path(@painting)
  end

  def destroy
    @painting.destroy
    redirect_to paintings_path
  end

  def delete
    @paintings = Painting.all
    @painting = Painting.find(params[:id])
  end

  private

  def set_painting
    @painting = Painting.find(params[:id])
    authorize @painting
  end

  def painting_params
    params.require(:painting).permit(:photo, :name, :painter, :category, :location, :dimensions, :price_per_day)
  end
end
