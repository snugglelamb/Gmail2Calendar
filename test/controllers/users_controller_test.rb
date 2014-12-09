require 'simplecov'
SimpleCov.start 'rails'
require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  tests User::UsersController
  include Devise::TestHelpers
  include Warden::Test::Helpers                        
    Warden.test_mode!                                    
  
  setup do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = users(:one)
    @request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_auth2] 
  end

  test "blocks unauthenticated access" do
    post :create, { user: { email: "user@example.org", password: "password", password_confirmation: "password" }}
        assert_redirected_to new_user_session_path
    end

  test "allows authenticated access" do
      sign_in @user
      get :index
     assert_response :success
    end
 

  test "user password wrong length" do
     user = User.find_by_name("swap")
     user.psw = "12"
     assert !user.save, "password too short"
     #assert_equal !user.save, false
   end

  test "should get new" do
    sign_in @user
    get :new
    assert_response :success
  end

  test "non google account user should not log in" do
    _user = User.new(:email => 'test@example.com', :password => 'password', :password_confirmation => 'password')
   
    assert_no_difference('User.count') do
      post :create, _user
    end
  end

  test "should not be able to create new user" do
    sign_in @user
    assert_no_difference('User.count') do
      post :create, user: {:email => 'test@example.com', :password => 'password22'} 
    end
    
  end
  
  
  test "should show user" do
    sign_in @user
    get :show, id: @user
    assert_response :success
    assert_template "users/show"
  end

  test "should get edit" do
    sign_in @user
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    sign_in @user
    patch :update, id: @user, user: { account: @user.account, name: @user.name, psw: @user.psw }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    sign_in @user
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
  
  test "index" do
    assert_respond_to( @controller, :index )
  end
end