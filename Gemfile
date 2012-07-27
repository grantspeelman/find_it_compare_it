require 'rbconfig'
source 'http://rubygems.org'
gem 'rails', '~> 3.2.0'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'omniauth-google'
gem 'oa-openid'

gem 'dm-rails'
if ENV['TEST_DATABASE_URL'].include?("mysql")
  gem 'dm-postgres-mysql'
elsif ENV['TEST_DATABASE_URL'].include?("sqlite")
  gem 'dm-sqlite-adapter'
else
  gem 'dm-postgres-adapter'
end

gem 'dm-validations'
gem 'dm-timestamps'
gem 'dm-migrations'
gem 'dm-pager'

gem 'simple_form'
gem 'country_select'
gem 'jquery-rails', '~> 2.0.0'
gem 'cancan'
gem 'kaminari'
gem 'heroku'
gem 'thin'

group :assets do
  gem 'uglifier'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
end

group :test do
  gem 'capybara'
  gem 'poltergeist'
end

