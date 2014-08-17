module SignUpHelpers
  def click_sign_up
    visit root_path
    click_button 'Sign Up'
  end

  def click_sign_in
    visit root_path
    click_button 'Sign In'
  end

  def success_notification(text)
    expect(page).to have_css '.notice', text: text
  end
end
