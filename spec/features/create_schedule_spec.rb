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

  scenario "specifies first and last hours of the schedule" do
    day = Time.now.strftime "%A"
    visit schedule_create_for_day_path(day)

    within '#SCHEDULE TIMEFRAME FORM NAME' do
      find.("#first-hour-of-schedule").find(:xpath, "option[7]").select_option
      find.("#last-hour-of-schedule").find(:xpath, "option[7]").select_option
    end

    click_button "Next"
    expect(page).to have_content "Now write your schedule for #{day}."
  end

  scenario "specifies only first hour of the schedule and receives error" do
    day = Time.now.strftime "%A"
    visit schedule_create_for_day_path(day)

    within '#SCHEDULE TIMEFRAME FORM NAME' do
      find.("#first-hour-of-schedule").find(:xpath, "option[7]").select_option
    end

    click_button "Next"
    expect(page).to have_css ".alert", text: "You must specify both a start and
      stop hour for your #{day} schedule."
  end

  scenario "specifies hours, creates tasks, views results" do
    day = Time.now.strftime "%A"
    visit schedule_create_for_day_path(day)

    within '#SCHEDULE TIMEFRAME FORM NAME' do
      find.("#first-hour-of-schedule").find(:xpath, "option[7]").select_option
      find.("#last-hour-of-schedule").find(:xpath, "option[7]").select_option
    end

    click_button "Next"

    within '#SOME HOUR FORM' do
      find('input').set('Something I need to do')
    end

    within '#SOME HOUR FORM #2' do
      find('input').set('Something I also need to get done')
    end

    click_button "View Schedule"
    expect(page).to have_content "Something I need to do"
    expect(page).to have_content "Something I also need to get done"
  end
end
