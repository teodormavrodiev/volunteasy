class SendEventSmsJob < ApplicationJob
  queue_as :default

  def perform(registration_id)
    registration = Registration.find(registration_id)
    registration.reminder
  end
end
