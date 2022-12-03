class Event < ApplicationRecord
  belongs_to :school

  has_many :event_days, dependent: :destroy
  accepts_nested_attributes_for :event_days
  has_many :registrations, dependent: :destroy
  has_many :children, through: :registrations
end
