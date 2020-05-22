class PaintingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_painting, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR painter ILIKE :query"
      @paintings = policy_scope(Painting).where(sql_query, query: "%#{params[:query]}%")
    else
      @paintings = policy_scope(Painting)
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
    @painting.photo.attach(painting_params[:photo])
    authorize @painting
    redirect_to painting_path(@painting)
  end

  def destroy
    @painting.destroy
    authorize @painting
    redirect_to paintings_path
  end

  def delete
    @paintings = Painting.all
    set_painting
    # authorize @painting
    # @painting = Painting.find(params[:id])
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
