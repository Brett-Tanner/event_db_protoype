class Event < ApplicationRecord
  belongs_to :school

  has_many :event_days
  has_many :registrations
  has_many :children, through: :registrations
end
