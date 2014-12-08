# IMPORTANT: This file is generated by cucumber-rails - edit at your own peril.
# It is recommended to regenerate this file in the future when you upgrade to a
# newer version of cucumber-rails. Consider adding your own code to a new file
# instead of editing this one. Cucumber will automatically load all features/**/*.rb
# files.
require 'simplecov'
SimpleCov.start 'rails'
require 'cucumber/rails'
require 'fakeweb'
Capybara.javascript_driver = :webkit
# Capybara defaults to CSS3 selectors rather than XPath.
# If you'd prefer to use XPath, just uncomment this line and adjust any
# selectors in your step definitions to use the XPath syntax.
# Capybara.default_selector = :xpath

# By default, any exception happening in your Rails application will bubble up
# to Cucumber so that your scenario will fail. This is a different from how
# your application behaves in the production environment, where an error page will
# be rendered instead.
#
# Sometimes we want to override this default behaviour and allow Rails to rescue
# exceptions and display an error page (just like when the app is running in production).
# Typical scenarios where you want to do this is when you test your error pages.
# There are two ways to allow Rails to rescue exceptions:
#
# 1) Tag your scenario (or feature) with @allow-rescue
#
# 2) Set the value below to true. Beware that doing this globally is not
# recommended as it will mask a lot of errors for you!
#
ActionController::Base.allow_rescue = false

# Remove/comment out the lines below if your app doesn't have a database.
# For some databases (like MongoDB and CouchDB) you may need to use :truncation instead.
begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

# FakeWeb.allow_net_connect = false
# FakeWeb.register_uri(:post, 'http://google.com/oauth/request_token', :body => 'oauth_token=fake&oauth_token_secret=fake')
# FakeWeb.register_uri(:post, 'http://google.com/oauth/access_token', :body => 'oauth_token=fake&oauth_token_secret=fake')
# FakeWeb.register_uri(:get, 'http://google.com/account/verify_credentials.json', :response => File.join('features', 'fixtures', 'verify_credentials.json'))

Before('@admin') do
  OmniAuth.config.test_mode = true

  # the symbol passed to mock_auth is the same as the name of the provider set up in the initializer
  OmniAuth.config.mock_auth[:google] = {
      "provider"=>"google_oauth2",
      "uid"=>"11796155715968097629",
      "info"=>{"email"=>"test@xxxx.com", "first_name"=>"Test", "last_name"=>"User", "name"=>"Test User"},
      "credentials" => {"token" => "mytoken","secret" => "mysecret"}
    }
end
OmniAuth.config.add_mock(:google_oauth2, 
{"uid" => '12345', "credentials" => {"token" => "mytoken","secret" => "mysecret"} })
After('@admin') do
  OmniAuth.config.test_mode = false
end
# Before('@admin') do
#   OmniAuth.config.test_mode = true
#
#   # the symbol passed to mock_auth is the same as the name of the provider set up in the initializer
#   OmniAuth.config.mock_auth[:google_oauth2] = {
#       "provider"=>"google_oauth2",
#       "uid"=>"11796155715968097629",
#       "email"=>"cit597project@gmail.com"
#   }
# end
#
# After('@admin') do
#   OmniAuth.config.test_mode = false
# end

# You may also want to configure DatabaseCleaner to use different strategies for certain features and scenarios.
# See the DatabaseCleaner documentation for details. Example:
#
#   Before('@no-txn,@selenium,@culerity,@celerity,@javascript') do
#     # { :except => [:widgets] } may not do what you expect here
#     # as Cucumber::Rails::Database.javascript_strategy overrides
#     # this setting.
#     DatabaseCleaner.strategy = :truncation
#   end
#
#   Before('~@no-txn', '~@selenium', '~@culerity', '~@celerity', '~@javascript') do
#     DatabaseCleaner.strategy = :transaction
#   end
#

# Possible values are :truncation and :transaction
# The :transaction strategy is faster, but might give you threading problems.
# See https://github.com/cucumber/cucumber-rails/blob/master/features/choose_javascript_database_strategy.feature
Cucumber::Rails::Database.javascript_strategy = :truncation

