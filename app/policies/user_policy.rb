class UserPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope #= Event
    end
  end

  def my_events?
    return true
  end

end
