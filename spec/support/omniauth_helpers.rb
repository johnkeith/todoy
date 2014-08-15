# based on https://gist.github.com/spyou/1200365
module OmniAuthHelpers
  def valid_omniauth(opts = {})
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:facebook, { 
      provider: "facebook",
      uid: "12344",
      info: {
        email: "tester@example.com",
        name: "Tester"
        }
      })
  end

  def invalid_omniauth(opts = {})
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
  end
end
