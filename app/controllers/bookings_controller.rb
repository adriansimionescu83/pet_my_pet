class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @pet = Pet.find(params[:pet_id])
    @booking = Booking.new
  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def booking_params
    params.require(:review).permit(:content) #Change the content
  end
end
