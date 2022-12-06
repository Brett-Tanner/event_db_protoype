class EventDay < ApplicationRecord
  belongs_to :event

  has_many :registrations, dependent: :destroy
  has_many :children, through: :registrations
end