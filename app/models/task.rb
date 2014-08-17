class Task < ActiveRecord::Base
  validates :timeframe_id, presence: true

  belongs_to :timeframe
end
