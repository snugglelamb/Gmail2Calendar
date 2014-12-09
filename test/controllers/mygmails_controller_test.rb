
require 'test_helper'

class MygmailsControllerTest < ActionController::TestCase
  tests Mygmail::MygmailsController
  include Devise::TestHelpers
  include Warden::Test::Helpers                        
    Warden.test_mode!
    
  setup do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = users(:one)
    @request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_auth2] 
    @mygmail = mygmails(:one)
  end

  test "should get index" do
    sign_in @user
    get :index, user_id: @mygmail.user_id
    assert_response :success
    assert_not_nil assigns(:mygmail)
  end

  test "should get new" do
    sign_in @user
    get :new, user_id: @mygmail.user_id
    assert_response :success
  end

  test "should create mygmail" do
    sign_in @user
    assert_difference('Mygmail.count') do
      post :create, mygmail:{eid:20, content:"New gmail T^T test"}, user_id: @user.id
      mygmail =Mygmail.last
    end
    assert_redirected_to user_mygmail_path(@user.id, assigns(:mygmail))
    
  end
  
  # HUGE HINT HERE
  # for nested resource, remember to feed user_id to post/get
  # and when using assert_redirect_to, send @user.id along with assigns(:mygmail)

  test "should show mygmail" do
    sign_in @user
    get :show, id: @mygmail, user_id: @mygmail.user_id
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get :edit, id: @mygmail, user_id: @mygmail.user_id
    assert_response :success
  end

  test "should update mygmail" do
    sign_in @user
    patch :update, id: @mygmail, mygmail: { eid: @mygmail.eid }, user_id: @user.id
    assert_redirected_to user_mygmail_path(@user.id, assigns(:mygmail))
  end

  test "should destroy mygmail" do
    sign_in @user
    assert_difference('Mygmail.count', -1) do
      delete :destroy, id: @mygmail, user_id: @mygmail.user_id
    end

    assert_redirected_to user_mygmails_path
  end
end
