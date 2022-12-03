class School < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :event_days, through: :events
  # has_many :event_children, through: :events TODO: more needed here cos custom association name
  has_many :users, dependent: :destroy
  has_many :children, through: :users
end
