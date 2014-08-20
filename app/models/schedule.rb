class Schedule < ActiveRecord::Base
  validates :user_id, presence: true
  validates :day_of_week, presence: true
  validates :day_of_week, inclusion: { in: %w(sunday monday tuesday wednesday
    thursday friday saturday) }
  validates :user_id, uniqueness: { scope: :day_of_week, case_sensative: false }

  belongs_to :user
  has_many :timeframes
  has_many :tasks, through: :timeframes
end
