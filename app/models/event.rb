class Event < ApplicationRecord

  belongs_to :admin, class_name: "User"
  has_many :attendances
  has_many :users, foreign_key: 'attendee_id'

  validate :must_begin_in_the_future
  validate :duration_multiple_of_five
  validates :start_date, presence: true
  validates :duration, presence: true, numericality: { greater_than: 0, only_integer: true}
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, numericality: { greater_than: 0, less_than: 1000, only_integer: true}
  validates :location, presence:true

  def must_begin_in_the_future
    errors.add(:start_date, "Must be after now") unless start_date.present? && start_date > Date.today
  end

  def duration_multiple_of_five
    errors.add(:duration, "Must be a multiple of 5") unless self.duration % 5 == 0
  end

end