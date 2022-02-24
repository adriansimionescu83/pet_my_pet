class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.user = current_user
    @review.booking = @booking
    @review.save
    redirect_to booking_path(@booking)
    authorize @review
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :user_id, :booking_id)
  end
end
