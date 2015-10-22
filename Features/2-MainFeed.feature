@mainfeed
Feature: Main Feed
  As a News:yc user
  I want to be able to read, post, save, forward and comment on stories on the main feed
  So I can begin expressing my point of view

Background:
  Given I am on the Main Feed screen

#NOTE: User must have a valid account at HackerNews.com/submit

@readmain
Scenario:  Read stories on the Main feed 
 When I touch the second post
 And I am on the Submission screen
 And I touch the Back arrow
 Then I am on the Main Feed screen

@newmain
Scenario:  Read all new stories
 When I touch New on the tab bar
 And I am on the New screen
 And I touch the Back arrow
 Then I am on the Main Feed screen

@loginmain
Scenario: Login
  When I touch Profile on the tab bar
  And I am on the Login screen
  And I enter "valid" login credentials
  Then I am on the Main Feed screen

@searchmain
Scenario: Search
  When I touch Search on the tab bar
  And I create a successful search
  And I touch Home on the tab bar
  Then I am on the Main Feed screen

@textmain
Scenario: Submitting a text
  When I successfully submit a Text
  Then I am on the Main Feed screen

@texturl
Scenario: Submitting a url
  When I successfully submit an URL
  Then I am on the Main Feed screen










