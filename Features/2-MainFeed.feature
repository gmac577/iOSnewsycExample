@mainfeed
Feature: Main Feed
  As a News:yc user
  I want to be able to read, post, save, forward and comment on stories on the main feed
  So I can begin expressing my point of view

#NOTE: User must have a valid account at HackerNews.com/submit
#NOTE: These small scenarios could be combined into one long one but are not for demonstration

@readstory
Scenario:  Read stories on the Main feed 
 Given I am on the Main Feed screen
 And I touch the second post
 And I am on the Submission screen
 And I touch the Back arrow
 Then I am on the Main Feed screen
