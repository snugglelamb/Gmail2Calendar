Given(/^I am not a valid user$/) do
  visit user_session_path
end

When(/^I sign in$/) do
  
  fill_in('Email', :with => "1234@gmail.com")
  fill_in('Password', :with => "1234")
  click_button("Log in")
end

Then(/^I should not be able to login succesfully$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should not have access to the private content$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I am a valid user$/) do
 
end

Then(/^I should be able to login successfully$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should have access to the private content$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I sign in with the incorrect password$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see an error message$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I sign in with an invalid email$/) do
  pending # express the regexp above with the code you wish you had
end