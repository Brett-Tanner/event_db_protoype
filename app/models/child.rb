class Child < ApplicationRecord
  after_save :register_all_events

  belongs_to :user

  has_many :registrations, dependent: :destroy
  accepts_nested_attributes_for :registrations
  has_many :event_days, through: :registrations
  has_many :events, through: :event_days
  has_many :emergency_contacts, dependent: :destroy
  has_one :school, through: :user

  validates :category, inclusion: {in: ["gaibu", "naibu", "yoyaku"], message: "That's not a valid category of student"}

  def events
    super.distinct
  end

  def attend_event?(event)
    return true if self.events.include?(event)
    false
  end

  private

  def register_all_events
    self.school.events.each do |event|
      event.event_days.each do |ed|
        ed.registrations.create(event_day_id: ed.id, child_id: self.id, attend_morning: false, attend_afternoon: false)
      end
    end
  end
end