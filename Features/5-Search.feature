
@search
Feature: Search
  As a News:yc user
  I want to be able to search stories and browse the results 
  So I can see the specific information I need

Background:
  Given I am on the Main Feed screen

#NOTE: User must have a valid account at HackerNews.com/submit


@searchstory
Scenario: Search
  When I touch Search on the tab bar
  And I create a successful search
  And I touch Home on the tab bar
  Then I am on the Main Feed screen

@readsearchstory
Scenario:  Read stories on the New feed 
 When I touch Search on the tab bar
 And I do a search
 And I touch Home on the tab bar
 Then I am on the Main Feed screen
