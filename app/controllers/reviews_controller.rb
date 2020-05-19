class ReviewsController < ApplicationController
  def new
    @painting = Painting.find(params[:painting_id]) 
    @review = Review.new
  end

  def create
    @painting = Painting.find(params[:painting_id])
    @review = Review.new(review_params)
    @review.painting = @painting
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
