class ReviewsController < ApplicationController
  def new
    @painting = Painting.find(params[:painting_id])
    authorize @review
    @review = Review.new
  end

  def create
    @painting = Painting.find(params[:painting_id])
    authorize @review
    @review = Review.new(review_params)
    @review.painting = @painting
    @review.user = current_user
    if @review.save
      redirect_to painting_path(@painting)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
