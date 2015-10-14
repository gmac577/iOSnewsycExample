@morepage
Feature: More options
As a News:yc user
  I want to be able to read the various posts, submissions, comments and FAQ of other users
  So I can understand their point of view

Background:
  Given I am on the Main Feed screen
  When I touch More on the tab bar
  And I am on the Hacker News menu page
 
@wip
@morebest
Scenario: Reading the best submissions by news:yc users
  And I touch Best Submissions
  And I am on the Best Submissions page
  And I touch the second post
  And I am on the Submission page
  And I touch the page and I see the subtabbar
  And I touch the Best Submissions header
  And I am on the Best Submissions page
  And I touch Back
  And I am on the Hacker News menu page

@wip
  @moreactive
  Scenario: Reading the active discussions by news:yc users
  And I touch Active Discussions
  And I am on the Active Discussions page
  And I touch the second post
  And I am on the Active page
  And I touch the page and I see the subtabbar
  And I touch Active
  And I am on the Active Discussions page
  And I touch Hacker News
  And I am on the Hacker News menu page

@wip
  @moreclassic
  Scenario: Reading the archived submissions by news:yc users
  And I touch Classic View
  And I am on the Classic View page
  And I touch the second post
  And I am on the Submission page
  And I touch the page and I see the subtabbar
  And I touch Classic
  And I am on the Classic View page
  And I touch Hacker News
  And I am on the Hacker News menu page

@wip
  @moreask
  Scenario: Reading the questions posted by news:yc users
  And I touch Ask HN
  And I am on the Ask HN page
  And I touch the second post
  And I am on the Submission page
  And I touch the page and I see the subtabbar
  And I touch Ask HN on the header
  And I am on the Ask HN page
  And I touch Hacker News
  And I am on the Hacker News menu page


@wip
  @morecomments
  Scenario: Reading the best comments posted by news:yc users
  And I touch Best Comments
  And I am on the Best Comments page
  And I touch the second post
  And I am on the Comments page
  And I touch the page and I see the subtabbar
  And I touch Hacker News
  And I am on the Hacker News menu page

@wip
  @newcomments
  Scenario: Reading the newest comments posted by news:yc users
  And I touch New Comments
  And I am on the New Comments page
  And I touch the second post
  And I am on the Comments page
  And I touch the page and I see the subtabbar
  And I touch Hacker News
  And I am on the Hacker News menu page


@wip
  @morefaq
  Scenario: Reading the Hacker News FAQ and using the various social media options
  And I touch Hacker News FAQ
  And I am on the Hacker News FAQ page
  And I touch the R button on the tab bar
  And I click on the page and I see the reader tab bar
  And I click on the Readablity Link and I sign in usibg each method
  And I click on the hamburger menu and I logout
  And I touch Back on the tab bar
  And I touch Back on the tab bar
  And I double click on the page and I see the reader tab bar
  And I click the Font button
  And I touch each font face and I adjust the size and background
  And I click on the page and I do not see the reader tab bar
  And I click on the page and I see the reader tab bar
  And I click on the Megaphone button
  And I see the Readability page
  And I touch Back on the tab bar
  And I click on the page and I see the reader tab bar
  And I touck the Action button
  And I successfully use the social media options
  And I touch Back

@wip
  @morenyc
  Scenario: Visiting the news:yc homepage
  And I touch news:yc homepage
  And I see the news:yc homepage open with the in-app browser
  And I touch Back

@wip
  @moretweet
  Scenario: Visiting the news:yc Twitter feed
  And I touch @news:yc Twitter 
  And I am on the Twitter feed for news:yc
  And I touch Back
  And I touch the Home button
  Then I am on the Main Feed screen






