class SchedulesController < ApplicationController
  before_action :authenticate_user!

  def show_current_day
    day = Time.now.strftime "%A"
    redirect_to schedule_for_day_path(day)
  end

  def show_day
    @schedule = Schedule.find_by(user_id: current_user, day_of_week: params[:day])

    if @schedule.nil?
      flash.now[:alert] = "You have no schedules at the current moment.
        Try creating a new one!"
    end
  end
end
