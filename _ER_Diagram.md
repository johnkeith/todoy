# ER Diagram

Users
  has_many schedules
  has_many tasks, through schedules
  has_many timeframes

Schedules
  has_many tasks
  belongs_to user

Tasks
  belongs_to schedule
  belongs_to timeframe

Timeframes
  belongs_to user
  has_many tasks
