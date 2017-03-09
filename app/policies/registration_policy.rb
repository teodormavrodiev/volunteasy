class RegistrationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def destroy?
    user_is_participant_or_admin?
  end

  def update?
    user_is_organizer_or_admin? && (record.event.end_time < DateTime.now)
  end

  private

  def user_is_participant_or_admin?
    ( record.participant == user ) || user.admin
  end

  def user_is_organizer_or_admin?
    ( record.event.organizer == user ) || user.admin
  end


end
