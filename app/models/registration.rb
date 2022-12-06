class Registration < ApplicationRecord
  belongs_to :child
  belongs_to :event_day
  has_one :event, through: :event_day
end
