@newfeed
Feature: New Feed
  As a News:yc user
  I want to be able to read, post, save, forward and comment on the newest stories 
  So I can stay current with my information

Background:
  Given I am on the Main Feed screen

#NOTE: User must have a valid account at HackerNews.com/submit

@feednew
Scenario:  View new stories
 When I touch New on the tab bar
 Then I am on the New screen

@readnew
Scenario:  Read stories on the New feed 
 When I read a story on the New feed
 Then I am on the Main Feed screen

@textnew
Scenario: Submitting a text
 When I submit a new Text
 And I touch Home on the tab bar 
 Then I am on the Main Feed screen

@urlnew
Scenario: Submitting a url
  When I submit a new URL
  And I touch Home on the tab bar
  Then I am on the Main Feed screen