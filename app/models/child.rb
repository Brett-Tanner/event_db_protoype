class Child < ApplicationRecord
  belongs_to :user

  has_many :registrations, dependent: :destroy
  has_many :events, through: :registrations
end