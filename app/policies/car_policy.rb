class CarPolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def my_cars?
    true
  end

  def show?
    true
  end

  class Scope < Scope
    def resolve
      scope.where(sold: false)
    end
  end
end
