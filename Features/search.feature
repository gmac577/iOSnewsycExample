
@search
Feature: Search
  As a News:yc user
  I want to be able to read, post, save, forward and comment on the newest stories 
  So I can stay current with my information

Background:
  Given I am on the Main Feed screen

#NOTE: User must have a valid account at HackerNews.com/submit


@searchmain
Scenario: Search
  When I touch Search on the tab bar
  And I create a successful search
  And I touch Home on the tab bar
  Then I am on the Main Feed screen

@readmain
Scenario:  Read stories on the New feed 
 When I touch the second post
 And I am on the Submission screen
 And I touch the Back arrow
 Then I am on the Main Feed screen

@textmain
Scenario: Submitting a text
  When I successfully submit a Text
  And I touch Home on the tab bar
  Then I am on the Main Feed screen

@texturl
Scenario: Submitting a url
  When I successfully submit an URL
  And I touch Home on the tab bar
  Then I am on the Main Feed screen