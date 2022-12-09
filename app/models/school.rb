class School < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :event_days, through: :events
  has_many :users, dependent: :destroy
  accepts_nested_attributes_for :users
  has_many :children, through: :users
  has_many :event_children, through: :events, source: :children
end
