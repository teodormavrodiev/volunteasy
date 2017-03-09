class EventPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all #= Event
    end
  end

  def create?
    true
  end

  def users?
    true
  end

  def my_events?
    true
  end

  def update?
    user_is_organizer_or_admin?
  end

  def destroy?
    user_is_organizer_or_admin?
  end

  private

  def user_is_organizer_or_admin?
    record.organizer_id == user.id || user.admin
  end

end
