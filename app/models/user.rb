class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :created_events, foreign_key: "user_id", class_name:"Event"
  has_many :attended_events
  has_many :events_attended, through: :attended_events, source: :event
end
