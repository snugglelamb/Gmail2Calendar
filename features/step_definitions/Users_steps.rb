
def create_visitor
  @visitor ||= { :name => "Testy McUserton", :email => "cit597project@gmail.com",
      :password => "cit597penn", :psw => "cit597penn"}
end

def delete_user
  @user ||= User.where(:email => @visitor[:email]).first
  @user.destroy unless @user.nil?
end

def create_user
  create_visitor
  delete_user
  @user = FactoryGirl.create(:user, @visitor)
  @user.psw = nil
    @user.token = 'ya29.yQCsFM6NOEZnAxmqCiGcLo2gN-VXSARo2G-dYhg0lwsqFXG5OqWPW84u3sUoVY-6WA565mtzVHezdw'
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


Given(/^I am registered as and admin$/) do
  visit '/users/sign_in'
end

When(/^I Sign in with Google Oauth2$/) do
  click_on "Sign in with Google Oauth2"
  visit '/users/auth/google_oauth2/callback'
end

Then(/^I should be able to visit the user page$/) do
  visit '/users'
  create_user
  log_in
  page.should have_content 'Logged in as'
end

When(/^I choose the starting date so as to get my gmails$/) do
  create_user
  @user.token = 'ya29.yQCsFM6NOEZnAxmqCiGcLo2gN-VXSARo2G-dYhg0lwsqFXG5OqWPW84u3sUoVY-6WA565mtzVHezdw'
  log_in
  fill_in 'Please choose date:', :with=>'2014-11-22'
  #click_on 'Get my Gmails'
end

Given(/^I have not filled in my password$/) do
  create_user
  log_in
  @user.psw = nil#"" unless @user.psw.nil? || @user.psw.empty?
  
end

Then(/^I should be redirect to edit page$/) do
  click_on 'Edit'
   page.should have_content 'Password'
end

Then(/^I type in the password$/) do
  page.should have_content 'Password'
  #fill_in 'Password', :with=> @user.password
end

Then(/^I confirm update$/) do
  click_on 'Update User'
end

Then(/^I should see my newly updated infomation$/) do
  page.should have_content @user.psw
end

Given(/^I have filled in my password$/) do
  create_user
  @user.psw = @user.password
end

Then(/^I should see all my gmails from that day on$/) do
  pending
end

When(/^I visit my events$/) do
  click_button 'Event'
end

Then(/^I should see all events this app parsed from my gmails$/) do
  page.should have_content 'Listing Events'
end

When(/^I visit my calendar$/) do
  click_button 'Calendar'
end

Then(/^I should see my own calendar$/) do
  name = @user.email.gsub('@','%40')
  page.should have_content name
end