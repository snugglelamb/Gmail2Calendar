ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

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
end
