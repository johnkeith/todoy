require 'rails_helper'

RSpec.configure do |config|
  config.include SignInHelpers, type: :feature
end

feature "user views schedule for the day", js: true do
  # As a user, I want to be able to see my schedule for the current day of the
  # week, so that I can know what I should be doing
  background do
    create_user_and_sign_in
  end


end

feature "user sees current task highlighted", js: true do
  # As a suer, I want my current task to be highlighted, 
  # so that I can easily tell what I should do next
end
