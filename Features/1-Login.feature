@login
Feature: Login
  As a News:yc user
  I want to be able to login
  So I can begin adding comments and managing my account


#NOTE: User must have a valid account at HackerNews.com/submit
#NOTE: These small scenarios could be combined into one long one but are not for demonstration

@wrongname
Scenario: Unsuccessful wrong name Login
  Given I am on the Main Feed screen
  When I touch Profile on the tab bar
  And I am on the Login screen
  And I enter "invalidname" login credentials
  And I see the alert message "Unable to Authenticate"
  And I am on the Login screen
  

@wrongpass
Scenario: Unsuccessful Login
  Given I am on the Main Feed screen
  When I touch Profile on the tab bar
  And I am on the Login screen
  When I enter "invalidpass" login credentials
  And I see the alert message "Unable to Authenticate"
  And I am on the Login screen
  
  
@blankname
Scenario: Unsuccessful noname Login 
  Given I am on the Main Feed screen
  When I touch Profile on the tab bar
  And I am on the Login screen
  When I enter "blankname" login credentials
  And I see the alert message "Unable to Authenticate"
  And I am on the Login screen
  

@blankpass
Scenario: Unsuccessful no pass Login 
  Given I am on the Main Feed screen
  When I touch Profile on the tab bar
  And I am on the Login screen
  When I enter "blankpass" login credentials
  And I see the alert message "Unable to Authenticate"
  And I am on the Login screen


@cancellogin
Scenario: Canceling the login attempt
  Given I am on the Main Feed screen
  When I touch Profile on the tab bar
  And I am on the Login screen
  And I touch Cancel
  Then I am on the Main Feed screen


@goodlogin
Scenario: Successful Login 
  Given I am on the Main Feed screen
  When I touch Profile on the tab bar
  And I am on the Login screen
  And I enter "valid" login credentials
  Then I am on the Main Feed screen



