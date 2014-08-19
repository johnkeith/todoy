class HomeController < ApplicationController
  def home
    if user_signed_in?
      day = Time.now.strftime "%A"
      redirect_to schedule_for_day_path(day)
    end
  end
end
