
require 'simplecov'
SimpleCov.start 'rails'
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
  
  
  test "should be able to sort gmails by eid" do
    sign_in @user
    
    m1 = mygmails(:one)
    m2 = mygmails(:two)
    get :sort, user_id: @mygmail.user_id
    assert Mygmail.all.index(m2) > Mygmail.all.index(m1)
    
    ## funny assert here, need to figure out how to make value in fixtures just integer
  end
  
  test "should parse time correctly" do
    temp = MygmailsController.new

    text = mygmails(:one).content
    parsed = temp.parsetime text
    assert_not_nil parsed.to_s =~/2014-12-12/
    
    text = mygmails(:two).content
    parsed = temp.parsetime text
    assert_not_nil parsed.to_s =~/2014-12-12/
    
    text = mygmails(:three).content
    parsed = temp.parsetime text
    assert_not_nil parsed.to_s =~/2014-12-12/
    
    text = mygmails(:four).content
    parsed = temp.parsetime text
    assert_not_nil parsed.to_s =~/2014-12-12/
    
  end
  
  test "should add Events to Calendar" do 
    sign_in @user
    temp = MygmailsController.new
    assert_not_nil temp.addevent @user
  end
  
  test "should get gmail and store event" do
    sign_in @user
    assert_difference('Event.count', 6) do
      get(:getGmails, user_id: @mygmail.user_id, q:"2014-11-20")
    end
  end
  
end



# require 'test_helper'
#
# class MygmailsControllerTest < ActionController::TestCase
#   setup do
#     @mygmail = mygmails(:one)
#   end
#
#   test "should get index" do
#     get :index
#     assert_response :success
#     assert_not_nil assigns(:mygmails)
#   end
#
#   test "should get new" do
#     get :new
#     assert_response :success
#   end
#
#   test "should create mygmail" do
#     assert_difference('Mygmail.count') do
#       post :create, mygmail: { eid: @mygmail.eid }
#     end
#
#     assert_redirected_to mygmail_path(assigns(:mygmail))
#   end
#
#   test "should show mygmail" do
#     get :show, id: @mygmail
#     assert_response :success
#   end
#
#   test "should get edit" do
#     get :edit, id: @mygmail
#     assert_response :success
#   end
#
#   test "should update mygmail" do
#     patch :update, id: @mygmail, mygmail: { eid: @mygmail.eid }
#     assert_redirected_to mygmail_path(assigns(:mygmail))
#   end
#
#   test "should destroy mygmail" do
#     assert_difference('Mygmail.count', -1) do
#       delete :destroy, id: @mygmail
#     end
#
#     assert_redirected_to mygmails_path
#   end
# end
>>>>>>> 80b9531d57e14817f50e56632a38fd98ebb927af
