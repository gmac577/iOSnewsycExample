@profile
Feature: Profile
  As a News:yc user
  I want to be able to login and see my profile
  So I can begin adding comments and managing my account

Background:
  Given I navigate to the login screen

#NOTE: User must have a valid account at HackerNews.com/submit

@wrongname
Scenario: Unsuccessful wrong name Login
  When I enter "invalidname" login credentials
  And I see the alert message "Unable to Authenticate"
  Then I am on the Login screen
  
@wrongpass
Scenario: Unsuccessful Login
  When I enter "invalidpass" login credentials
  And I see the alert message "Unable to Authenticate"
  Then I am on the Login screen
  
@blankname
Scenario: Unsuccessful noname Login 
  When I enter "blankname" login credentials
  And I see the alert message "Unable to Authenticate"
  Then I am on the Login screen
  
@blankpass
Scenario: Unsuccessful no pass Login 
  When I enter "blankpass" login credentials
  And I see the alert message "Unable to Authenticate"
  Then I am on the Login screen

@cancellogin
Scenario: Canceling the login attempt
  When I touch Cancel
  Then I am on the Main Feed screen

@goodlogin
Scenario: Successful Login 
  When I enter "valid" login credentials
  Then I am on the Main Feed screen

@loginaction
Scenario:  View my profile and see my submissions and comments once I've logged in
  When I enter "valid" login credentials
  And I am on the Main Feed screen
  And I navigate to my profile
  Then I am on the Main Feed screen


