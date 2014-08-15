require 'rails_helper'
require_relative '../support/omniauth_helpers'

RSpec.configure do |config|
  config.include SignUpHelpers, type: :feature
  config.include OmniAuthHelpers, type: :feature
end

feature "User signs up for todoy", js: true do
  # As a user, I want to be able to sign up using my email,
  # so that sign up is disconnected from other social accounts.

  # As a user, I want to be able to sign up using my Facebook or Twitter account,
  # so that sign up is simple.
  background do
    click_sign_up
  end

  scenario "successful sign up using email" do
    click_link "Using Email"
    fill_in "Name", with: "Tester"
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password1234"
    fill_in "Password confirmation", with: "password1234"
    click_button "Sign up"
    success_notification "Welcome! You have signed up successfully."
  end

  scenario "failed sign up using email" do
    click_link "Using Email"
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password1234"
    click_button "Sign up"
    faliure_notification "prohibited this user from being saved"
  end
  
  scenario "successful sign up using Facebook" do
    valid_omniauth
    click_link "Using Facebook"
    success_notification "Successfully authenticated from Facebook account."
  end

  scenario "failed sign up using Facebook" do
    invalid_omniauth
    click_link "Using Facebook"
    expect(page).to have_content "Invalid credentials"
  end

  scenario "successful sign up using Twitter" do
    click_link "Using Twitter"
    success_notification "Successfully authenticated from Twitter account."
  end

  scenario "failed sign up using Twitter" do
    click_link "Using Twitter"
    expect(page).to have_content "Invalid credentials"
  end
end
