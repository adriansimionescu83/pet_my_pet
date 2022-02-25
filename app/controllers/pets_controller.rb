class PetsController < ApplicationController
  def index
    @pets = policy_scope(Pet).order(created_at: :desc)

    @markers = @pets.geocoded.map do |pet|
      if pet.is_available
        {
          lat: pet.latitude,
          lng: pet.longitude,
          info_window: render_to_string(partial: "info_window", locals: { pet: pet }),
          image_url: helpers.asset_url("paw-circle.png")
        }
      end
    end

    if params[:query].present?
      return @pets = Pet.global_search(params[:query])
    else
      return @pets.all
    end
  end

  def my_pets
    @pets = policy_scope(Pet).where(user_id: current_user.id).order(created_at: :desc)
  end

  def new
    @pet = Pet.new
    authorize @pet
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    if @pet.save
      redirect_to my_pets_path
    else
      render :new
    end
    authorize @pet
    if current_user.is_pet_owner == false
      current_user.is_pet_owner = true
      current_user.save
    end
  end

  def show
    @pet = Pet.find(params[:id])
    authorize @pet
    @booking = Booking.new
    @marker = [{ lat: @pet.latitude, lng: @pet.longitude, image_url: helpers.asset_url("paw-circle.png") }]
    @reviews = @pet.reviews.select do |review|
        review.user_id != @pet.user_id
      end
  end

  def edit
    @pet = Pet.find(params[:id])
    authorize @pet
  end

  def destroy
    @pet = Pet.find(params[:id])
    if @pet.delete
      redirect_to my_pets_path, notice: 'Your pet was successfully deleted.'
    else
      render :my_pets
    end
    authorize @pet

    if current_user.is_pet_owner != pet_owner?
      current_user.is_pet_owner = pet_owner?
      current_user.save
    end
  end

  def update
    @pet = Pet.find(params[:id])
    if current_user.is_pet_owner != pet_owner?
      current_user.is_pet_owner = pet_owner?
      current_user.save
    end
    if @pet.update(pet_params)
      redirect_to my_pets_path, notice: 'Your pet was successfully updated.'
    else
      render :edit
    end
    authorize @pet
  end

  private

  def pet_owner?
    return true if Pet.where(user_id: current_user.id).count.positive?
  end

  def pet_params
    params.require(:pet).permit(:name, :gender, :age, :description, :price_per_day, :location, :is_available, :breed_id, :species_id, :user_id, :photo)
  end
end
