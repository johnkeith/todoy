require 'rails_helper'

RSpec.configure do |config|
  config.include SignInHelpers, type: :feature
end

feature "user views schedule for the current day", js: true do
  # As a user, I want to be able to see my schedule for the current day of the
  # week, so that I can know what I should be doing
  background do
    create_user_and_sign_in
  end

  scenario "sees activities for each hour" do
    day = Time.now.strftime "%A"
    visit schedules_show_current_path
    expect(page).to have_css ".timeframe", count: 12
    expect(page).to have_css "button", text: "Edit Schedule for #{day}"
  end

  scenario "receives warning message that no schedule exists" do
    day = Time.now.strftime "%A"
    visit schedules_show_current_path
    expect(page).to have_content 
      "You have no schedules at the current moment. Try creating a new one!"
    expect(page).to have_css "button", text: "Create Schedule for #{day}" 
  end

end

feature "user sees current task highlighted", js: true do
  # As a suer, I want my current task to be highlighted, 
  # so that I can easily tell what I should do next
end
