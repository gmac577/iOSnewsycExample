@mainfeed
Feature: Main Feed
  As a News:yc user
  I want to be able to read, post, save, forward and comment on stories on the main feed
  So I can begin expressing my point of view

#NOTE: User must have a valid account at HackerNews.com/submit
#NOTE: These small scenarios could be combined into one long one but are not for demonstration

@readmain
Scenario:  Read stories on the Main feed 
 Given I am on the Main Feed screen
 And I touch the second post
 And I am on the Submission screen
 And I touch the Back arrow
 Then I am on the Main Feed screen

@newmain
Scenario:  Read all new stories
 Given I am on the Main Feed screen
 And I touch New on the tab bar
 And I am on the New screen
 And I touch the Back arrow
 Then I am on the Main Feed screen

@loginmain
Scenario: Login
  Given I am on the Main Feed screen
  When I touch Profile on the tab bar
  And I am on the Login screen
  And I enter "valid" login credentials
  And I pause 5 seconds
  Then I am on the Main Feed screen

@searchmain
Scenario: Search
  Given I am on the Main Feed screen
  When I touch Search on the tab bar
  And I create a search query
  And I verify I see "Microsoft" in the story text
  And I touch Recent on the header
  And I verify I see "Microsoft" in the story text
  And I touch Home on the tab bar
  Then I am on the Main Feed screen

@moremain
Scenario: Reading the various posts, submissions, comments and FAQ
  Given I am on the Main Feed screen
  When I touch More on the tab bar
  And I see 'More' options
  And I touch Best Submissions
  And I am on the Best Submissions page
  And I touch Active Discussions
  And I am on the Active Discussions page
  And I touch Classic View
  And I am on the Classic View page
  And I touch Ask HN
  And I am on the Ask HN page
  And I touch Best Comments
  And I am on the Best Comments page
  And I touch New Comments
  And I am on the New Comments page
  And I touch Hacker News FAQ
  And I am on the Hacker News FAQ page
  And I touch news:yc homepage
  And I am on the news:yc homepage
  And I touch @news:yc Twitter 
  And I am on the Twitter feed for news:yc
  And I touch the Home button
  Then I am on the Main Feed screen


@sharemain
Scenario: Sharing a URL or a text 
  Given I am on the Main Feed screen
  When I touch Share on the header
  And I touch Submit URL
  And I enter "title" in the title text field
  And I touch Cancel
  And I touch Discard
  And I touch Share on the header
  And I touch Submit Text
  And I enter "title" in the title text field
  And I touch Post Body
  And I enter "body_contents" in the post body field
  And I touch Cancel
  And I touch Discard
  And I touch the Home button
  Then I am on the Main Feed screen














