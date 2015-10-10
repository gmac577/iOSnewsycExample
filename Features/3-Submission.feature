@submission
Feature: Submission 
  As a News:yc user
  I want to be able to submit posts and comments on stories I've read
  So I can let people know how I feel

#NOTE: User must have a valid account at HackerNews.com/submit
#NOTE: These small scenarios could be combined into one long one but are not for demonstration
#NOTE: These scenarios require the user to NOT be signed into their account
#NOTE: 'Downvote' is greyed out at the moment

@subreply
Scenario:  Post a reply to stories on the Main feed 
  Given I am on the Main Feed screen
  When I touch Profile on the tab bar
  And I am on the Login screen
  And I enter "valid" login credentials
  And I pause 5 seconds
  And I am on the Main Feed screen
  And I touch the second post
  And I am on the Submission screen
  And I touch Reply on the tab bar
  And I create a reply post
  And I touch Cancel
  And I touch the Discard button
  Then I am on the Submission screen


@subvote
Scenario:  Vote on a story
  Given I am on the Main Feed screen
  When I touch Profile on the tab bar
  And I am on the Login screen
  And I enter "valid" login credentials
  And I pause 5 seconds
  And I am on the Main Feed screen
  And I touch the second post
  And I am on the Submission screen
  And I touch Upvote on the tab bar
  Then I am on the Submission screen


@subflag
Scenario:  Flag a story
  Given I am on the Main Feed screen
  When I touch Profile on the tab bar
  And I am on the Login screen
  And I enter "valid" login credentials
  And I pause 5 seconds
  And I am on the Main Feed screen
  And I touch the second post
  And I am on the Submission screen
  And I touch Flag on the tab bar
  And I touch Cancel on the menu
  And I am on the Main Feed screen
  And I touch the second post
  And I am on the Submission screen
  And I touch Flag on the tab bar
  And I touch Flag on the menu
  Then I am on the Main Feed screen

@subaction
Scenario:  View the submitter of the story you've read and see their submissions and comments
  Given I am on the Main Feed screen
  When I touch Profile on the tab bar
  And I am on the Login screen
  And I enter "valid" login credentials
  And I pause 5 seconds
  And I am on the Main Feed screen
  And I touch the second post
  And I am on the Submission screen
  And I touch Action on the tab bar
  And I touch Cancel on the menu
  And I am on the Main Feed screen
  And I touch the second post
  And I am on the Submission screen
  And I touch Action on the tab bar
  And I touch Submitter on the menu
  And I see the totals for karma and average
  And I touch the Submissions header
  And I touch the Comments header
  And I touch the Submission arrow
  And I am on the Submission screen









