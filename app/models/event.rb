class Event < ApplicationRecord

  belongs_to :creator, foreign_key: "user_id", class_name: "User", primary_key: :id
  has_many :attended_events
  has_many :attendees, through: :attended_events, source: :user
end
