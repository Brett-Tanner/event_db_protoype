class EventDay < ApplicationRecord
  belongs_to :event

  has_many :registrations, dependent: :destroy
  has_many :children, through: :registrations

  def children_attending
    self.registrations.where(attend_morning: true).or(self.registrations.where(attend_afternoon: true)).count
  end
end