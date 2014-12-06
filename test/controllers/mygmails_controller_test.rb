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
