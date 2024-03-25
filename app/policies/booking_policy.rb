class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    pet_owner? == false
  end

  def approve?
    pet_owner?
  end

  def reject?
    pet_owner?
  end

  def completed?
    pet_owner?
  end

  def show?
    booking_owner? || pet_owner? # We are showing the bookings only for pet owners
  end

  def destroy?
    booking_owner? || pet_owner?
  end

  private

  def pet_owner?
    record.pet.user == user
  end

  def booking_owner?
    record.user == user
  end
end
