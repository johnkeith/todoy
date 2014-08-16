class SchedulesController < ApplicationController
  before_action :authenticate_user!

  def show_current
    @schedule = Schedule.where(user_id: current_user.id, day_of_week: current_day)
  end
end
