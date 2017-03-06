class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # has_many :events, class_name: "User",
  #                   foreign_key: "owner_id"
  # has_many :events, through: :registrations, class_name: "User",
  #                   foreign_key: "volunteer_id"
end
