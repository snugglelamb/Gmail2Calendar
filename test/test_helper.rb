require 'simplecov'
SimpleCov.start 'rails'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'capybara'
require 'database_cleaner'
require 'capybara/dsl'


require 'rails/test_help'
#require "rails_app/config/environment"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def sign_in(user = double('user'))
        if user.nil?
          allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => :user})
          allow(controller).to receive(:current_user).and_return(nil)
        else
          allow(request.env['warden']).to receive(:authenticate!).and_return(user)
          allow(controller).to receive(:current_user).and_return(user)
        end
  end

  
  Capybara.configure do |config|
    config.run_server = false
    config.default_driver = :webkit
    config.app_host = 'http://localhost:3000' # change url
  end
end

class Configurable < User
  devise :database_authenticatable, :confirmable, :rememberable, :timeoutable, :lockable,
         stretches: 15, pepper: 'abcdef', allow_unconfirmed_access_for: 5.days,
         remember_for: 7.days, timeout_in: 15.minutes, unlock_in: 10.days

end


# if valid user, then devise warden give authentication
# controller receive as current_user
