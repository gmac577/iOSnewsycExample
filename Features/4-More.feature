@morepage
Feature: More options
As a News:yc user
  I want to be able to read the various posts, submissions, comments and FAQ of other users
  So I can understand their point of view

Background:
  Given I am on the Main Feed screen
  When I touch More on the tab bar
  And I am on the Hacker News menu page
 

@morebest
Scenario: Reading the best submissions by news:yc users
  And I touch Best Submissions
  And I am on the Best Submissions page
  And I touch the second post
  And I am on the Submission page
  And I return to the previous screen
  And I return to the previous screen
  Then I am on the Hacker News menu page

  @moreactive
  Scenario: Reading the active discussions by news:yc users
  And I touch Active Discussions
  And I am on the Active Discussions page
  And I touch the second post
  And I am on the Active page
  And I touch the story title to read the full article
  And I return to the previous screen
  And I return to the previous screen
  And I am on the Active Discussions page
  And I return to the previous screen
  And I am on the Hacker News menu page


  @moreclassic
  Scenario: Reading the archived submissions by news:yc users
  And I touch Classic View
  And I am on the Classic View page
  And I touch the second post
  And I am on the Submission page
  And I touch the page
  And I see the subtabbar
  And I return to the previous screen
  And I am on the Classic View page
  And I return to the previous screen
  And I am on the Hacker News menu page

  @moreask
  Scenario: Reading the questions posted by news:yc users and posting
  And I touch Profile on the tab bar
  And I enter "valid" login credentials
  And I am on the Main Feed screen
  And I touch More on the tab bar
  And I am on the Hacker News menu page
  And I touch Ask HN
  And I am on the Ask HN page
  And I touch the second post
  And I successfully submit a post
  And I am on the Submission page
  And I return to the previous screen
  And I am on the Ask HN page
  And I return to the previous screen
  Then I am on the Hacker News menu page

  @morecomments
  Scenario: Reading the newest and best comments posted by news:yc users
  And I touch Profile on the tab bar
  And I enter "valid" login credentials
  And I am on the Main Feed screen
  And I touch More on the tab bar
  And I am on the Hacker News menu page
  And I touch Best Comments
  And I am on the Best Comments page
  And I touch the page
  And I see the subtabbar
  And I touch Flag on the subtabbar
  And I am on the Best Comments page
  And I return to the previous screen
  And I am on the Hacker News menu page
  And I touch New Comments
  And I am on the New Comments page
  And I return to the previous screen
  Then I am on the Hacker News menu page


 @morenyc
  Scenario: Visiting the news:yc homepage
  And I touch news:yc homepage
  And I am on the news:yc homepage page
  And I return to the previous screen
  Then I am on the Hacker News menu page


@moretweet
  Scenario: Visiting the news:yc Twitter feed
  And I touch @news:yc Twitter 
  And I am on the @news:yc Twitter page
  And I return to the previous screen
  Then I am on the Hacker News menu page

@morefaq
  Scenario: Reading the Hacker News FAQ and using the various social media options
  And I touch Hacker News FAQ
  And I am on the Hacker News FAQ page
  And I touch the Action button on the FAQ tab bar
  And I touch the Refresh button on the FAQ tab bar
  And I touch the R button on the FAQ tab bar
  And I return to the previous screen
  Then I am on the Hacker News menu page


 






