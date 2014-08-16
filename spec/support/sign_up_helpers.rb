module SignUpHelpers
  def click_sign_up
    visit root_path
    click_link 'Sign Up'
  end

  def click_sign_in
    visit root_path
    click_link 'Sign In'
  end

  def success_notification(text)
    expect(page).to have_css '.notice', text: text
  end
end
