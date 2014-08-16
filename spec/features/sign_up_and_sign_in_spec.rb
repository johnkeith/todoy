require 'rails_helper'
require_relative '../support/omniauth_helpers'

RSpec.configure do |config|
  config.include SignUpHelpers, type: :feature
  config.include OmniAuthHelpers, type: :feature
end

feature "User signs up/in for todoy using Facebook", js: true do
  # As a user, I want to be able to sign up using my email,
  # so that sign up is disconnected from other social accounts.
  background do
    click_sign_up
  end

  scenario "successful sign up/in using Facebook" do
    valid_omniauth
    click_link "Using Facebook"
    success_notification "Successfully authenticated from Facebook account."
  end

  scenario "failed sign up/in using Facebook" do
    invalid_omniauth
    click_link "Using Facebook"
    expect(page).to have_content "Invalid credentials"
  end
end

feature "User signs up for todoy using email", js: true do
  # As a user, I want to be able to sign up using my Facebook or Twitter account,
  # so that sign up is simple.
  background do
    click_sign_up
  end

  scenario "successful sign up using email" do
    click_link "Using Email"
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
    expect(page).to have_css '#error_explanation'
    expect(page).to have_content "prohibited this user from being saved"
  end
end

feature "User signs in to todoy using email", js: true do
  # As a user, I want to be able to sign up using my email,
  # so that sign up is not connected to my social accounts.
  background do
    click_sign_in
  end

  scenario "successful sign in using email" do
    user = FactoryGirl.create(:user)
    click_link "Using Email"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
    success_notification "Signed in successfully."
  end

  scenario "failed sign in using email" do
    user = FactoryGirl.create(:user)
    click_link "Using Email"
    fill_in "Email", with: user.email
    fill_in "Password", with: "notthepassword"
    click_button "Sign in"
    expect(page).to have_css ".alert"
    expect(page).to have_content "Invalid email or password"
  end
end
