class Timeframe < ActiveRecord::Base
  validates :schedule_id, presence: true
  belongs_to :schedule
  has_many :tasks
end
