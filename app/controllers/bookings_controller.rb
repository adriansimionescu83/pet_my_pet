class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
    # The below will ensure that when the index is render, whatever bookings are overdue will be marked as completed
    complete_booking
    # Bookings will be listed in a hash to be used by the index view
    @bookings_hash = {
      bookings_sitter:{
        submitted: [],
        approved: [],
        rejected: [],
        completed: []
      },     
      bookings_owner:{
        submitted: [],
        approved: [],
        completed: [],
      }
    }

    @bookings.each do |booking|
      if booking.user_id == current_user.id
        @bookings_hash[:bookings_sitter][booking.status.downcase.to_sym] << booking
      elsif booking.pet.user_id == current_user.id
        @bookings_hash[:bookings_owner][booking.status.downcase.to_sym] << booking
      end
    end

  end

  def approve
    booking_find
    @booking.status = 'Approved'
    @booking.save
    authorize @booking

    redirect_to bookings_path
  end

  def reject
    booking_find
    @booking.status = 'Rejected'
    @booking.save
    authorize @booking

    redirect_to bookings_path
  end

  def completed
    booking_find
    @booking.status = 'Completed'
    @booking.save
    authorize @booking

    redirect_to bookings_path
  end

  def show
    booking_find
    @review = Review.new
    @reviews = Review.all

    @owner_reviews = []
    @sitter_reviews = []

    @reviews.each do |review|
      if review.booking.pet.user_id == @booking.pet.user_id && @booking.pet.user_id != current_user.id
        @owner_reviews << review
      elsif review.booking.user_id == @booking.user_id && @booking.user_id != current_user.id
        @sitter_reviews << review
      end
    end

    @bookings = Booking.all
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    pet_find
    @booking.user = current_user
    @booking.status = "Submitted"
    @booking.pet = @pet
    @booking.duration = @booking.date_end - @booking.date_start
    @booking.total_amount = @booking.pet.price_per_day * @booking.duration
    if @booking.save
      redirect_to bookings_path
    else
      render :index
    end
    authorize @booking
  end

  def edit
    booking_find
  end

  def update
    booking_find
    @booking.update(booking_params)
    @booking.duration = @booking.date_end - @booking.date_start
    @booking.total_amount = @booking.pet.price_per_day * @booking.duration
    @booking.save

    redirect_to booking_path(@booking)
  end

  def destroy
    booking_find
    if @booking.delete
      redirect_to bookings_path(@booking_path)
    else
      render :index
    end

    authorize @booking
  end

  def complete_booking
    @bookings.each do |booking|
      booking.status = "Completed" if booking.date_end < Date.today
      booking.save
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date_start, :date_end, :message)
  end

  def pet_find
    @pet = Pet.find(params[:pet_id])
  end

  def booking_find
    @booking = Booking.find(params[:id])
  end
end
