class Event < ApplicationRecord
  validates :title, :body, presence: true

  scope :future, ->  { where('date < ?', Date.today) }
  scope :past, -> {where('date >= ?', Date.today)}

  def add_attendee(user)
    self.attendees << user
  end

  belongs_to :creator, foreign_key: "user_id", class_name: "User", primary_key: :id
  has_many :attended_events
  has_many :attendees, through: :attended_events, source: :user
end
