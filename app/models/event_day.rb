class EventDay < ApplicationRecord
  belongs_to :event

  has_many :registrations
  has_many :children, through: :registrations
end