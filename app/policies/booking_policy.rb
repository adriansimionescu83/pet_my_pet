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
    show?
  end

  def reject?
    show?
  end

  def show?
    record.pet.user == user # We are showing the bookings only for pet owners
  end

  def destroy?
    owner?
  end

  private

  def owner?
    record.user == user
  end
end
