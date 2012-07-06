require 'openid/store/filesystem'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, '', ''
  provider :facebook, '', '', :grant_type => 'client_credentials'
  provider :google, '', ''
  provider :developer # if Rails.env.development?
  # use OmniAuth::Strategies::OpenID, OpenID::Store::Filesystem.new(Rails.root.join('tmp'))
end