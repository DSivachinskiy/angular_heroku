module OmniauthHelper
  def set_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      'provider' => 'facebook',
      'info' => {
         'urls' => {
          'url' => 'facebook.com'
          },
        },
      'extra' => {
        'raw_info' => {
        'email' => 'test@gmail.com',
        'first_name' => 'name',
      }
      }
    })
  end
end