class BookingPolicy < ApplicationPolicy

  def create?
    true
  end

  def destroy?
    record.user == user
  end

  def my_bookings?
    true
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
