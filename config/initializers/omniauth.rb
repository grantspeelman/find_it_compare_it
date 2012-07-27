require 'openid/store/filesystem'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  provider :google, ENV['GOOGLE_KEY'], ENV['GOOGLE_SECRET']
  provider :developer, :fields => [:name, :email, :image] if Rails.env.development?
end