module SignUpHelpers
  def click_sign_up
    visit root_path
    click_link 'Sign Up or Sign In'
  end

  def success_notification(text)
    expect(page).to have_css '.notice', text: text
  end

  def faliure_notification(text)
    expect(page).to have_content text
    expect(page).to have_css '#error_explanation'
    expect(page).not_to have_css '.notice'
  end
end
