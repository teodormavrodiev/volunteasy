class Event < ApplicationRecord
  belongs_to :owner,  class_name: "User",
                      foreign_key: "owner_id"

  has_many :users, class_name: "User", through: :registrations
end
