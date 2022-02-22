class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @pet = Pet.find(params[:pet_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @pet = Pet.find(params[:pet_id])
    @booking.user = current_user
    @booking.pet = @pet
    @booking.save
    redirect_to pet_path(@pet)
  end

  def edit
    @booking = booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)

    redirect_to booking_path(@booking)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.delete

    redirect_to booking_path(@booking_path)
  end

  private

  def booking_params
    params.require(:booking).permit(:date_start, :date_end)
  end
end
