class Event < ApplicationRecord
  belongs_to :school

  has_many :event_days, dependent: :destroy
  accepts_nested_attributes_for :event_days
  has_many :children, through: :event_days
  has_many :registrations, through: :event_days

  def children
    super.distinct
  end

  # this is an abomination
  def children_attending
    self.children.reduce(0) do |memo, child|
      if child.registrations.where(attend_morning: true).or(child.registrations.where(attend_afternoon: true)).where(event_day_id: self.event_days.map{|ed| ed.id}).empty?
        memo
      else
        memo += 1
      end 
    end
  end
end
