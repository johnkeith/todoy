# ER Diagram

Users
  has_many schedules
  has_many timeframes, through schedules
  has_many tasks, through timeframes

Schedules
  has_many timeframes
  has_many tasks, through timeframes
  belongs_to user

Timeframes
  belongs_to schedule
  has_many tasks

Tasks
  belongs_to timeframe
