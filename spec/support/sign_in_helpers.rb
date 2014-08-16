module SignInHelpers
  def create_user_and_sign_in
    user = FactoryGirl.create(:user)
    visit root
    click_button "Sign in"
    click_link "With Email"
    fill_in "Email", with: user.Email
    fill_in "Password", with: user.password
    click_button "Sign In"
  end
end
