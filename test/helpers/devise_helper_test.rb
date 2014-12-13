require 'test_helper'

class DeviseHelperTest < ActionDispatch::IntegrationTest
  #include Devise::TestHelpers
  include Capybara::DSL
  setup do
    model_labels = { models: { user: "the user" } }
    translations = {
      errors: { messages: { not_saved: {
        one: "Can't save %{resource} because of 1 error",
        other: "Can't save %{resource} because of %{count} errors",
      } } },
      activerecord: model_labels
    }

    I18n.available_locales
    I18n.backend.store_translations(:en, translations)
    
  end

  teardown do
    I18n.reload!
  end

  test 'register with devise' do
    post user_registration_path
    assert_response :success 
    
  end
  
  test 'forget password' do
      get new_user_password_url
      assert_response :success 
     # fill_in 'email', with: 'new_user123'
      #assert page.has_content?('error')
      
    
  
  end
end