module ScheduleHelpers
  def build_full_schedule(user)
    create_schedule_each_day(user)
    create_timeframes_each_hour
    create_tasks_each_timeframe
  end

  def build_one_day_schedule(user, day)
    Schedule.create(user_id: user.id, day_of_week: day)
    create_timeframes_each_hour
    create_tasks_each_timeframe
  end

  def create_schedule_each_day(user)
    days_of_week = %w(Sunday Monday Tuesday Wednesday
    Thursday Friday Saturday)
    
    days_of_week.each do |day|
      Schedule.create(user_id: user.id, day_of_week: day)
    end
  end

  def create_timeframes_each_hour
    hours_am = [7,8,9,10,11]
    hours_pm = [12,1,2,3,4,5,6,7]
    
    Schedule.all.each do |schedule|
      hours_am.each do |hour|
        Timeframe.create(schedule_id: schedule.id, hour: hour, am_pm: "am")
      end
      hours_pm.each do |hour|
        Timeframe.create(schedule_id: schedule.id, hour: hour, am_pm: "pm")
      end
    end
  end

  def create_tasks_each_timeframe
    Timeframe.all.each_with_index do |timeframe, idx|
      Task.create(timeframe_id: timeframe.id, description: "Task No. #{idx}")
    end
  end
end
