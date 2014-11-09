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
  page.should have_content "#{@user[:name]}"
end

When(/^I sign in with a wrong email$/) do
 @visitor = @visitor.merge(:email => "wrong@example.com")
 log_in
end

When(/^I sign in with a wrong password$/) do
  @visitor = @visitor.merge(:email => "wrongpassword")
  log_in
end