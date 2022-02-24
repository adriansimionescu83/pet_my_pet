class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
    complete_booking
  end

  def approve
    booking_find
    @booking.status = 'Approved'
    @booking.save
    authorize @booking

    redirect_to booking_path(@booking)
  end

  def reject
    booking_find
    @booking.status = 'Rejected'
    @booking.save
    authorize @booking

    redirect_to booking_path(@booking)
  end

  def show
    booking_find
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    pet_find
    @booking.user = current_user
    @booking.pet = @pet
    calculate_amount
    @booking.save
    redirect_to bookings_path(@booking)
    authorize @booking
  end

  def edit
    booking_find
  end

  def update
    booking_find
    @booking.update(booking_params)

    redirect_to booking_path(@booking)
  end

  def destroy
    booking_find
    @booking.delete

    redirect_to bookings_path(@booking_path)
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:date_start, :date_end)
  end

  def pet_find
    @pet = Pet.find(params[:pet_id])
  end

  def booking_find
    @booking = Booking.find(params[:id])
  end

  def calculate_amount
    @number_of_days = @booking.date_end - @booking.date_start
    @booking.total_amount = @booking.pet.price_per_day * @number_of_days
  end

  def complete_booking
    @bookings = policy_scope(Booking).order(created_at: :desc)
    @bookings.each do |booking|
      booking.status = "Completed" if booking.date_end < Date.today
    end
  end
end
