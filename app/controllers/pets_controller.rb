class PetsController < ApplicationController

  def index
    @pets = policy_scope(Pet).order(created_at: :desc)

  def new
    @pet = Pet.new
    authorize @pet
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    if @pet.save
      redirect_to pets_path
    else
      render :new
    end
    authorize @pet
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :gender, :age, :description, :price_per_day, :location, :is_available, :breed_id, :user_id)

  end
end
