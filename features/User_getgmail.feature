@getgmail
Feature: getgmail
  In order to get access to gmails
  As a user
  I want to be able to get my gmails

 
	  　Background: a user can log with google account
	    Given I am signed in with provider "google_oauth2"
	    

      Scenario: User has not provide password for gmail account
	  	Given I have not filled in my password	 
        When I choose the starting date so as to get my gmails
		
        Then I should be redirect to edit page
		Then I type in the password
		Then I confirm update
		Then I should see my newly updated infomation
		
	    Scenario: User has provided password for gmail account
		  Given I have filled in my password
	      When I choose the starting date so as to get my gmails
	      Then I should see all my gmails form that day on
	  
		  When I visit my events
		  Then I should see all events this app parsed from my gmails
	  
		  When I visit my calendar
		  Then I should see my own calendar
	  