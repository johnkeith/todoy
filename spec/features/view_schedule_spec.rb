require 'rails_helper'

RSpec.configure do |config|
  config.include SignInHelpers, type: :feature
  config.include ScheduleHelpers, type: :feature
end

feature "user views schedule for the current day", js: true do
  # As a user, I want to be able to see my schedule for the current day of the
  # week, so that I can know what I should be doing

  scenario "sees activities for each hour" do
    user = FactoryGirl.create(:user)
    build_one_day_schedule(user)
    sign_in(user)
    expect(page).to have_css "li", count: 13
  end

  scenario "receives warning message that no schedule exists" do
    day = Time.now.strftime "%A"
    user = FactoryGirl.create(:user)
    sign_in(user)
    expect(page).to have_content 
      "You have no schedules at the current moment. Try creating a new one!"
    expect(page).to have_css "button", text: "Create Schedule for #{day}" 
  end
end

feature "user sees current task highlighted", js: true do
  # As a user, I want my current task to be highlighted, 
  # so that I can easily tell what I should do next
end

feature "user can edit schedule on the fly", js: true do
  # As a user, I want to be able to edit my schedule quickly, 
  # so that I can deal with the changing needs of the day
  # PERHAPS USE JQUERY UI DRAGGABLE + Angular for adjusting locations
end
