class Task < ActiveRecord::Base
  validates :timeframe_id, presence: true
  validates :timeframe_id, uniqueness: true

  belongs_to :timeframe
end
