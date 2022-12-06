class Child < ApplicationRecord
  belongs_to :user

  has_many :registrations, dependent: :destroy
  accepts_nested_attributes_for :registrations
  has_many :event_days, through: :registrations
  has_many :emergency_contacts, dependent: :destroy
end