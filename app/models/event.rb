class Event < ApplicationRecord
  belongs_to :school

  has_many :event_days, dependent: :destroy
  has_many :registrations, dependent: :destroy
  has_many :children, through: :registrations
end
