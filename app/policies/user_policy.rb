class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def follow?
    user != record
  end

  def unfollow?
    user != record
  end

  def destroy?
    record.user == user
  end

  def update?
    true
  end

end
