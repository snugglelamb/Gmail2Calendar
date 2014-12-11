# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string
#  psw                    :string
#  account                :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  provider               :string
#  uid                    :string
#  token                  :string
#
require 'simplecov'
SimpleCov.start 'rails'
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #include Devise::TestHelpers
  include Warden::Test::Helpers                  
   Warden.test_mode!                                    
  setup do
   # @request.env["devise.mapping"] = Devise.mappings[:user]
   @attr = {
         :name => "Example User",
         :email => "user@example.com",
         :password => "123changeme",
         :password_confirmation => "123changeme",
         :psw => "thepassword"
       }
    

       OmniAuth.config.mock_auth[:google_auth2] = OmniAuth::AuthHash.new({
           "provider"=>"google_oauth2",
           "uid"=>"11796155715968097629",
           "info"=>{"email"=>"test@xxxx.com", "first_name"=>"Test", "last_name"=>"User", "name"=>"Test User"},
           "credentials" => {"token" => "mytoken","secret" => "mysecret"}
           })
  end
  
  
  test "google_auth2 with present user" do
    #sign_in @user
    @user = User.new(@attr)
    assert User.find_for_google_oauth2(OmniAuth.config.mock_auth[:google_auth2] )
  end
  
  test "google_auth2 with registered user" do
    @user = User.new(@attr)
    assert @user.save
    assert User.where(:email =>@user.email).first
    _env = OmniAuth.config.mock_auth[:google_auth2]
    _env["uid"] = "thisisanewnewuid"
    _env["info"]["email"] = "user@example.com"
    assert User.find_for_google_oauth2(_env)
  end
  test "google_auth2 with non registered user" do
    
    _env = OmniAuth.config.mock_auth[:google_auth2]
    _env["uid"] = "thisisanewnewuid"
    assert User.find_for_google_oauth2(_env)
  end
  
 
end
