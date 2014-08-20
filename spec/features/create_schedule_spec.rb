require "rails_helper"

RSpec.configure do |config|
  config.include SignInHelpers, type: :feature
  config.include ScheduleHelpers, type: :feature
end

feature "user creates new schedule", js: true do
  background do
    user = FactoryGirl.create(:user)
    sign_in(user)
  end

  scenario "clicks button to create a new schedule" do
    day = Time.now.strftime "%A"
    click_button "Create Schedule for #{day}"
    expect(page).not_to have_css "button", text: "Create Schedule for #{day}"
    expect(page).to have_content "Select the the beginning and ending hours of
      your schedule. (For example, choose 9:00 AM for the beginning and 5:00
      PM for the ending of a typical workday.)"
    expect(page).to have_css "select", count: 2
  end

  scenario "successfully creates schedule and timeframes, but no tasks" do
  end

  scenario "unsuccessfully creates schedule and timeframes" do
  end
end
