class Activity < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :activity_type, presence: true
  validates :future_event, presence: true
  validates :duration, presence: true
  validates :calories, numericality: {
    only_integer: true
  }

  private

  def future_event
    errors.add(:start, "Can't be in the past!") if Date.parse(start) < Time.now
  end
end
