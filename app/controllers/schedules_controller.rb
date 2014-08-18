class SchedulesController < ApplicationController
  before_action :authenticate_user!

  def show_current
    @schedule = Schedule.find_by(user_id: current_user.id, day_of_week: current_day)
    
    if @schedule.nil?
      flash.now[:alert] = "You have no schedules at the current moment.
        Try creating a new one!"
    end
  end
end
