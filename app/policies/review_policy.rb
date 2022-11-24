class ReviewPolicy < ApplicationPolicy

  def create?
    true
  end

  def new?
    true
  end

  def show?
    true
  end

  def destroy?
    record.user == user
    # record: the review passed to the `authorize` method in controller
    # user: the `current_user` signed in with Devise
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
