require 'openid/store/filesystem'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, '', ''
  provider :facebook, '', ''
  provider :google, '', ''
  provider :developer, :fields => [:name, :email, :image] if Rails.env == 'development'
  # use OmniAuth::Strategies::OpenID, OpenID::Store::Filesystem.new(Rails.root.join('tmp'))
end