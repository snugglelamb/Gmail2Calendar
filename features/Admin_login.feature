@admin
Feature: Admin signs in  
  In order to use the app
  As an admin
  I want to sign in with Google-auth2

  Scenario: Admin signs in with Google-auth2
    Given I am registered as and admin
    When I Sign in with Google Oauth2
    Then I should be able to visit the user page