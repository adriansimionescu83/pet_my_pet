class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])

    @review.reviewer = current_user

    @review.booking = @booking
    @review.save
    redirect_to booking_path(@booking)

    @pet = @booking.pet
    sum = 0
    @pet.reviews.each do |review|
      sum += review.rating
    end
    @pet.average_rating = (sum / @pet.reviews.count.to_f).round(1)
    @pet.save
    authorize @review
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :user_id, :booking_id)
  end
end
