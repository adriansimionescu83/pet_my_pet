class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    record.pet.user != user
  end

  def approve?
    owner?
  end

  def reject?
    owner?
  end

  def completed?
    owner?
  end

  def show?
    renter? || owner? # We are showing the bookings only for pet owners
  end

  def destroy?
    owner?
  end

  private

  def owner?
    record.pet.user == user
  end

  def renter?
    record.user == user
  end
end
