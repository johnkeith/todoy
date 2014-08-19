module SignInHelpers
  def sign_in(user)
    visit root_path
    
    click_button "Sign In"
    
    click_link "Using Email"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    
    within("form") do
      click_button "Sign in"
    end
  end
end
