class School < ApplicationRecord
  has_many :events
  # has_many :event_children, through: :events TODO: more needed here cos custom association name
  has_many :users
  has_many :children, through: :users
end
