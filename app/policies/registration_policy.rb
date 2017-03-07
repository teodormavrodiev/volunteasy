class RegistrationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

 def update?
    user_is_participant_or_admin?
  end

  def destroy?
    user_is_participant_or_admin?
  end

  private

  def user_is_participant_or_admin?
    record.participant_id == user.id || user.admin
  end


end
