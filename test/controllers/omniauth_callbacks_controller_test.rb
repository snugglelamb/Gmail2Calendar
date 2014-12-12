require 'simplecov'
SimpleCov.start 'rails'
require 'test_helper'

class OmniauthCallbacksControllerTest < ActionController::TestCase
  # tests OmniauthCallbacks::OmniauthCallbacksController
  include Devise::TestHelpers
  include Warden::Test::Helpers                        
    Warden.test_mode!
    
  setup do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = users(:one)
    @request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_auth2] 
  end
  
  test "should pass test" do
    sign_in @user
    get(:google_oauth2, current_user: @user)
    assert_redirected_to new_user_registration_url
  end
  
  
end