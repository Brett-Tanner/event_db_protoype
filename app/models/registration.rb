class Registration < ApplicationRecord
  belongs_to :child
  belongs_to :event_day
end
