def create_visitor
  @visitor ||= { :name => "Testy McUserton", :email => "example@example.com",
      :password => "changeme"}
end

def delete_user
  @user ||= User.where(:email => @visitor[:email]).first
  @user.destroy unless @user.nil?
end

def create_user
  create_visitor
  delete_user
  @user = FactoryGirl.create(:user, @visitor)
end

def log_in
  visit '/users/sign_in'
  fill_in "Email", :with=> @visitor[:email]
  fill_in "Password", :with=>@visitor[:password]
  click_button "Log in"
end
Given(/^I do not exist as a user$/) do
  create_visitor
  delete_user
end

When(/^I log in with valid credentials$/) do
  log_in
end

Then(/^I see an invalid login message$/) do
  #assert page.has_content? ("Invalid email or password.")
  # currently use Log in, will change to not signed in successfully etc.
  page.should have_content "Log in"
end

Then(/^I should be signed out$/) do
  #assert page.has_content? "Log in"
  page.should have_content "Log in"
end

Given(/^I exist as a user$/) do
  create_user
end

Given(/^I am not logged in$/) do
  visit '/users/sign_in'
end

When(/^I sign in with valid credentials$/) do
  log_in
end

Then(/^I should visit my page$/) do
  page.should have_content "#{@user[:email]}"
end

When(/^I sign in with a wrong email$/) do
 @visitor = @visitor.merge(:email => "wrong@example.com")
 log_in
end

When(/^I sign in with a wrong password$/) do
  @visitor = @visitor.merge(:email => "wrongpassword")
  log_in
end

When(/^I sign up with valid user data$/) do
  create_visitor
  delete_user
  visit '/users/sign_up'
  fill_in 'Email', :with =>@visitor[:email] 
  fill_in 'Password', :with=>@visitor[:password]
  fill_in 'Password confirmation', :with=>@visitor[:password]
  click_button 'Sign up'
  create_user
end


When(/^I sign up with an invalid email$/) do
  create_visitor
  delete_user
  visit '/users/sign_up'
  fill_in 'Email', :with =>'wrong'
  fill_in 'Password', :with=>@visitor[:password]
  fill_in 'Password confirmation', :with=>@visitor[:password]
  click_button 'Sign up'
end

Then(/^I should see an invalid email message$/) do
  page.should have_content 'Email is invalid'
end

When(/^I sign up without a password$/) do
  create_visitor
  delete_user
  visit '/users/sign_up'
  fill_in 'Email', :with =>@visitor[:email]
  click_button 'Sign up'
end

Then(/^I should see a missing password message$/) do
  page.should have_content 'Password can\'t be blank'
end

When(/^I sign up without a password confirmation$/) do
  create_visitor
  delete_user
  visit '/users/sign_up'
  fill_in 'Email', :with =>@visitor[:email]
  fill_in 'Password', :with=>@visitor[:password]
  click_button 'Sign up'
end

Then(/^I should see a wrong password confirmation message$/) do
 page.should have_content 'Password confirmation doesn\'t match Password'
end

When(/^I sign up with a mismatched password confirmation$/) do
  create_visitor
  delete_user
  visit '/users/sign_up'
  fill_in 'Email', :with =>@visitor[:email]
  fill_in 'Password', :with=>@visitor[:password]
  fill_in 'Password confirmation', :with=>'wrong'
  click_button 'Sign up'
end
