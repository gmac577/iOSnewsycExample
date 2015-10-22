@login
Feature: Login
  As a News:yc user
  I want to be able to login
  So I can begin adding comments and managing my account

Background:
  Given I navigate to the login screen

#NOTE: User must have a valid account at HackerNews.com/submit

@wrongname
Scenario: Unsuccessful wrong name Login
  And I enter "invalidname" login credentials
  And I see the alert message "Unable to Authenticate"
  Then I am on the Login screen
  
@wrongpass
Scenario: Unsuccessful Login
  And I enter "invalidpass" login credentials
  And I see the alert message "Unable to Authenticate"
  Then I am on the Login screen
  
@blankname
Scenario: Unsuccessful noname Login 
  And I enter "blankname" login credentials
  And I see the alert message "Unable to Authenticate"
  Then I am on the Login screen
  
@blankpass
Scenario: Unsuccessful no pass Login 
  And I enter "blankpass" login credentials
  And I see the alert message "Unable to Authenticate"
  Then I am on the Login screen

@cancellogin
Scenario: Canceling the login attempt
  And I touch Cancel
  Then I am on the Main Feed screen

@goodlogin
Scenario: Successful Login 
  And I enter "valid" login credentials
  Then I am on the Main Feed screen



