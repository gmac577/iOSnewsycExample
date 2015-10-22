@morepage
Feature: More options
As a News:yc user
  I want to be able to read the various posts, submissions, comments and FAQ of other users
  So I can understand their point of view

Background:
  Given I have navigated successfully to the menu page

@morebest
Scenario: Reading the best submissions by news:yc users
  When I read all of the Best Submissions
  Then I am on the Hacker News menu page

@moreactive
  Scenario: Reading the active discussions and naviagting website
  When I read all of the Active Discussions
  Then I am on the Hacker News menu page

@moreclassic
  Scenario: Reading the archived submissions and activating secaondary toolbar
  When I read all of the archived submissions
  Then I am on the Hacker News menu page

@moreask
  Scenario: Reading the questions posted by news:yc users and posting
  When I have logged in as a user
  And I have navigated successfully to the menu page
  And I post a question
  Then I am on the Hacker News menu page

@morecomments
  Scenario: Reading the comments and flagging a comment
  When I have logged in as a user
  And I have navigated successfully to the menu page
  And I have flagged a comment
  Then I am on the Hacker News menu page

@morenyc
  Scenario: Visiting the news:yc homepage in the in-app browser
  When I touch news:yc homepage
  And I am on the news:yc homepage page
  And I return to the previous screen
  Then I am on the Hacker News menu page

@moretweet
  Scenario: Visiting the news:yc Twitter feed in the in-app browser
  When I touch @news:yc Twitter 
  And I am on the @news:yc Twitter page
  And I return to the previous screen
  Then I am on the Hacker News menu page

@morefaq
  Scenario: Reading the Hacker News FAQ and using the various tabbar options
  When I touch Hacker News FAQ
  And I am on the Hacker News FAQ page
  And I use the options on the tabbar
  Then I am on the Hacker News menu page


 






