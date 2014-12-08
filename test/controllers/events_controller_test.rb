require 'simplecov'
SimpleCov.start 'rails'
require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  tests Event::EventsController
  include Devise::TestHelpers
  include Warden::Test::Helpers                        
    Warden.test_mode!                                    
  
  setup do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = users(:one)
    @request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_auth2] 
    @event = events(:one)
  end

  test "should get index" do
    sign_in @user
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get new" do
    sign_in @user
    get :new
    assert_response :success
  end

  test "should create event" do
    sign_in @user
    @newEvent = Event.new
    @newEvent.name = "New Created Event"
    @newEvent.schedule = "2014-12-01 00:11:22"
    @newEvent.location = "Guess where"
    @newEvent.mygmail_id = 1
    
    assert_difference('Event.count') do
      post :create, event: { location: @newEvent.location, mygmail_id: @newEvent.mygmail_id, name: @newEvent.name, schedule: @newEvent.schedule }
    end

    assert_redirected_to event_path(assigns(:event))
  end

  test "should show event" do
    sign_in @user
    get :show, id: @event
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get :edit, id: @event
    assert_response :success
  end

  test "should update event" do
    sign_in @user
    patch :update, id: @event, event: { location: @event.location, mygmail_id: @event.mygmail_id, name: @event.name, schedule: @event.schedule }
    assert_redirected_to event_path(assigns(:event))
  end

  test "should destroy event" do
    sign_in @user
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to events_path
  end
end
