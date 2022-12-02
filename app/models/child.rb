class Child < ApplicationRecord
  belongs_to :user

  has_many :registrations
  has_many :events, through: :registrations
end