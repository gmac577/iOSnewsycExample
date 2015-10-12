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
  And I am on the Submission screen


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

#NOTE:The Mail app via Share Sheets crashes on the sim so there is currently no way to test this fuctionality; will test on the iPhone. 
#NOTE: Share Sheets cannot be accessed via the sim with automation; must be tested manually. Including the scenario for demonstration.  

@subshare
Scenario:  Sharing a story you've read athrough various ways via ShareSheets
  Given I am on the Main Feed screen
  When I touch Profile on the tab bar
  And I am on the Login screen
  And I enter "valid" login credentials
  And I pause 5 seconds
  And I am on the Main Feed screen
  And I touch the second post
  And I am on the Submission screen
  And I touch the Share button
  #And I touch the Mail button
  And I enter "email" in the "To" field
  And I enter "subject" in the "Subject" field
  And I enter "mail_reply_text" in the "Body" field
  And I touch the Send button
  And I touch the Share button
  And I touch the Reminders button
  And I enter "reminder_text" in the "Body" field
  And I touch Options
  And I touch the "Remind me on a day" button
  And I touch Alarm
  And I touch the Date column
  And I touch "Thu Dec 31"
  And I touch the Hour column
  And I touch "11"
  And I touch the Minute column
  And I touch "59"
  And I touch the Meridian column
  And I touch "PM"
  And I touch Repeat
  And I touch "Every Year"
  And I touch "Options"
  And I touch Priority
  And I touch "!!"
  And I touch Notes
  And I enter "notes_text" in the "Notes" field
  And I touch Reminder in the header
  And I touch Add
  And I touch the Share button
  And I touch the More button
  And I touch Done
  And I touch the Share button
  And I touch the Add button
  And I touch the Share button
  And I touch Copy
  And I touch the Share button
  And I touch the Read button
  And I touch Cancel
  And I touch the Share button
  And I touch Open
  And I see the article from "news.ycombinator.com" in Safari
  And I touch the "Back to news:yc" button in the header
  And I touch the Share button
  And I touch the More2 button
  And I touch Done
  And I touch Cancel
  Then I am on the Submission screen










