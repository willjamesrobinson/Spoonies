class ReviewsController < ApplicationController
  before_action :set_spooner, only: %i[new create]

  # def new
  #   @review = Review.new
  # end

  def create
    @review = Review.new(review_params)
    @review.spooner = @spooner
    @review.user = current_user
    authorize @review
    if @review.save
      redirect_to spooner_path(@spooner)
    else
      render "spooners/show", status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    authorize @review
    redirect_to spooner_path(@review.spooner), status: :see_other
  end

  private

  def set_spooner
    @spooner = Spooner.find(params[:spooner_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
