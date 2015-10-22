@submission
Feature: Submission 
  As a News:yc user
  I want to be able to submit posts and comments on stories I've read
  So I can let people know how I feel

  Background:
  Given I have logged in successfully
  When I navigate to the Submission screen

#NOTE: User must have a valid account at HackerNews.com/submit
#NOTE: These scenarios require the user to NOT be signed into their account
#NOTE: 'Downvote' is greyed out at the moment

@subreply
Scenario:  Post a reply to stories on the Main feed 
  And I successfully submit a post
  Then I am on the Submission screen

@subvote
Scenario:  Vote on a story
  And I touch Upvote on the tab bar
  Then I am on the Main Feed screen

@subflag
Scenario:  Flag a story
  And I succesfully flag a story
  Then I am on the Main Feed screen

@subaction
Scenario:  View the submitter's profile of the story you've read and see their submissions and comments
  And I navigte to a user's profile
  Then I am on the Main Feed screen

#NOTE:The Mail app via Share Sheets crashes on the sim so there is currently no way to test this fuctionality; will test on the iPhone. 
#NOTE: Share Sheets cannot be accessed via the sim with automation; must be tested manually. Including the scenario in the newsYC_steps.  











