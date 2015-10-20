# encoding: utf-8

require 'calabash-cucumber/calabash_steps'
#require 'pretty_face'

#############################
########                    #
########  Login/Profile     #
########                    #
#############################
Given(/^I am on the Login screen$/) do
  page(LoginPage).await
end
Given(/^I have logged in successfully$/) do 
  page(LoginPage).login_master
end
Given(/^I enter "(.*?)" login credentials$/) do |type|
  page(LoginPage).await
  page(LoginPage).login(type)
end
Given(/^I see the alert message "Unable to Authenticate"$/) do 
  page(LoginPage).touch_continue
end
Given(/^I touch Cancel$/) do 
  page(LoginPage).touch_cancel
end
#############################
########                    #
########  Main Feed         #
########                    #
#############################

Given(/^I am on the Main Feed screen$/) do
  page(FeedDetailsPage).await
end
Given(/^I am on the New screen$/) do
  page(FeedDetailsPage).see_new
end
Given(/^I touch the second post$/) do
  page(FeedDetailsPage).touch_row
end
Given(/^I verify I see "(.*?)" in the story text$/) do |searchtext|
  page(FeedDetailsPage).view_search(searchtext)
end
Given(/^I touch Recent on the header$/) do
  page(FeedDetailsPage).touch_rec
end
Given(/^I create a successful search$/) do
  step "I create a search query"
  step 'I verify I see "Microsoft" in the story text'
  step "I touch Recent on the header"
  step 'I verify I see "Microsoft" in the story text'
end
Given(/^I successfully submit an URL$/) do
  step "I touch Share on the header"
  step "I touch Submit URL"
  step 'I create a text title'
  step "I touch contents"
  step 'I create a text post'
  step "I touch Cancel"
  step "I touch Discard"
end
Given(/^I successfully submit a Text$/) do
  step "I touch Share on the header"
  step "And I touch Submit Text"
  step 'I create a URL title'
  step "I touch contents"
  step 'I create a URL post'
  step "I touch Cancel"
  step "I touch Discard"
end
Given(/^"I touch Share on the header"$/) do
  page(FeedDetailsPage).touch_share
end
Given(/^I touch (Submit URL|Submit Text)$/) do |choice|
  page(FeedDetailsPage).touch_choice(choice)
end
Given(/^I enter "title_text" in the title text field$/) do
  page(FeedDetailsPage).enter_title
end
#############################
########                    #
########  More              #
########                    #
#############################
Given(/^I touch (Best Submissions|Active Discussions|Active|Classic View|Ask HN|Best Comments|New Comments|Hacker News FAQ|news:yc homepage|@news:yc Twitter)$/) do |choice|
  page(MorePage).select_more_actions(choice)
end
Given(/^I am on the (Hacker News|Best Submissions|Submission|Active Discussions|Active|Classic View|Ask HN|Best Comments|New Comments|Hacker News FAQ|news:yc homepage|@news:yc Twitter) page$/) do |page|
 page(MorePage).page_handler(page)
end
Given(/^I touch the (R|Refresh|Action) button on the FAQ tab bar$/) do |choice|
  page(MorePage).faq_bar(choice)
end
Given(/^I am on the Hacker News menu page$/) do
  page(MorePage).seemenu
end
Given(/^I touch the page$/) do
  page(MorePage).table_view
end
Given(/^I see the subtabbar$/) do
  page(MorePage).find_item
end  
Given(/^I touch the story title to read the full article$/) do
  page(MorePage).story_time
end
Given(/^I return to the previous screen$/) do
  page(MorePage).backpage
end  
Given(/^I touch Flag on the subtabbar$/) do
  page(MorePage).touch_subflag
end  
Given(/^I have navigated successfully to the menu page$/) do
  step "I am on the Main Feed screen"
  step "I touch More on the tab bar"
  step "I am on the Hacker News menu page"
end
Given(/^I read the Best Submissions$/) do
  step "I touch Best Submissions"
  step "I am on the Best Submissions page"
  step "I touch the second post"
  step "I am on the Submission page"
  step "I return to the previous screen"
  step "I return to the previous screen"
end
Given(/^I read all of the Active Discussions$/) do
  step "I touch Active Discussions"
  step "I am on the Active Discussions page"
  step "I touch the second post"
  step "I am on the Active page"
  step "I touch the story title to read the full article"
  step "I return to the previous screen"
  step "I return to the previous screen"
  step "I am on the Active Discussions page"
  step "I return to the previous screen"
end
Given(/^I read all of the archived submissions$/) do
  step "I touch Classic View"
  step "I am on the Classic View page"
  step "I touch the second post"
  step "I am on the Submission page"
  step "I touch the page"
  step "I see the subtabbar"
  step "I return to the previous screen"
  step "I am on the Classic View page"
  step "I return to the previous screen"
end
Given(/^I have logged in as a user$/) do
  step "I touch Profile on the tab bar"
  step 'I enter "valid" login credentials'
end
Given(/^I post a question$/) do
  step "I touch Ask HN"
  step "I am on the Ask HN page"
  step "I touch the second post"
  step "I successfully submit a post"
  step "I am on the Submission page"
  step "I return to the previous screen"
  step "I am on the Ask HN page"
  step "I return to the previous screen"
end
Given(/^I have flagged a comment$/) do
  step "I touch Best Comments"
  step "I am on the Best Comments page"
  step "I touch the page"
  step "I see the subtabbar"
  step "I touch Flag on the subtabbar"
  step "I am on the Best Comments page"
  step "I return to the previous screen"
  step "I am on the Hacker News menu page"
  step "I touch New Comments"
  step "I am on the New Comments page"
  step "I return to the previous screen"
end 
Given(/^I use the options on the tabbar$/) do
  step "I touch the Action button on the FAQ tab bar"
  step "I touch the Refresh button on the FAQ tab bar"
  step "I touch the R button on the FAQ tab bar"
  step "I return to the previous screen"
end
#############################
########                    #
########  Search            #
########                    #
#############################
Given(/^I can bla the bla bla bla-bla-bla$/) do 
  page(BlaOnePage).bla_bla_bla(bla)
end
Given(/^I can bla the bla bla bla-bla-bla$/) do 
  page(BlaOnePage).bla_bla_bla(bla)
end
Given(/^I can bla the bla bla bla-bla-bla$/) do 
  page(BlaOnePage).bla_bla_bla(bla)
end
Given(/^I can bla the bla bla bla-bla-bla$/) do 
  page(BlaOnePage).bla_bla_bla(bla)
end

#############################
########                    #
########    Footer          #
########                    #
#############################
Given(/^I touch (Home|New|Profile|Search|More) on the tab bar$/) do |tab|
  page(FooterTabBarPage).select_tab(tab)
end
Given(/^I touch (Reply|Upvote|Flag|Downvote|Action) on the tab bar$/) do |tab|
  page(NavTabBarPage).select_storytab(tab)
end
Given(/^I see "(.*?)" notification count$/) do |count|
  page(TabBarPage).verify_notification_count(count)
end
Given(/^I touch (Flag|Cancel) on the menu$/) do |action|
  page(NavTabBarPage).flag_handler(action)
end
Given(/^I touch Continue$/) do
  page(NavTabBarPage).progess_on
end
Given(/^I touch Submitter on the menu$/) do
   page(NavTabBarPage).sub_handler
end
#############################
########                    #
########    Submission      #
########                    #
#############################

Given(/^I am on the Submission screen$/) do
  page(SubmissionPage).await
end
Given(/^I touch the Back arrow$/) do
  page(SubmissionPage).touch_back
end
Given(/^I create a (reply post|search query|text title|URL title|text post|URL post)$/) do |action|
  page(SubmissionPage).create_post(action)
end
Given(/^I touch the (Submissions|Comments) header$/) do |choice|
  page(SubmissionPage).select_action(choice)
end
Given(/^I touch the Submission arrow$/) do 
  page(SubmissionPage).touch_sub
end
Given(/^I see the totals for karma and average$/) do
  page(SubmissionPage).verify_page_elements
end
Given(/^I touch the Discard button$/) do
  page(SubmissionPage).touch_discard
end
Given(/^I touch the (Mail|Reminders|More|More2|Add|Copy|Read|Open) button$/) do |choice|
  page(SubmissionPage).select_share_action(choice)
end
Given(/^I navigate to the Submission screen$/) do
  step "I touch the second post"
  step "I am on the Submission screen"
end
Given(/^I successfully submit a post$/) do
  step "I touch Reply on the tab bar"
  step "I create a reply post"
  step "I touch Cancel"
  step "I touch the Discard button"
end
Given(/^I succesfully flag a story$/) do
  step "I touch Flag on the tab bar"
  step "I touch Cancel on the menu"
  step "I am on the Main Feed screen"
  step "I touch the second post"
  step "I am on the Submission screen"
  step "I touch Flag on the tab bar"
  step "I touch Flag on the menu"
end
Given(/^I navigte to a user's profile$/) do
  step "I touch Action on the tab bar"
  step "I touch Cancel on the menu"
  step "I am on the Main Feed screen"
  step "I touch the second post"
  step "I am on the Submission screen"
  step "I touch Action on the tab bar"
  step "I touch Submitter on the menu"
  step "I see the totals for karma and average"
  step "I touch the Submissions header"
  step "I touch the Comments header"
end
Given(/^I successfully send an email$/) do
  step "I touch the Share button"
  step "I touch the Mail button"
  step 'I enter "email" in the "To" field'
  step 'I enter "subject" in the "Subject" field'
  step 'I enter "mail_reply_text" in the "Body" field'
  step "I touch the Send button"
end

Given(/^And I successfully send a reminder%/) do
  step "I touch the Share button"
  step "I touch the Reminders button"
  step 'I enter "reminder_text" in the "Body" field'
  step "I touch Options"
  step 'I touch the "Remind me on a day" button'
  step "I touch Alarm"
  step "I touch the Date column"
  step 'I touch "Thu Dec 31'
  step "I touch the Hour column"
  step 'I touch "11"'
  step "I touch the Minute column"
  step 'I touch "59"'
  step "I touch the Meridian column"
  step 'I touch "PM"'
  step "I touch Repeat"
  step 'I touch "Every Year'
  step 'I touch "Options'
  step "I touch Priority"
  step 'I touch "!!"'
  step "I touch Notes"
  step 'I enter "notes_text" in the "Notes" field'
  step "I touch Reminder in the header"
  step "I touch Add"
end
Given(/^I test the rest of the Share Sheet options%/) do
  step "I touch the Share button"
  step "I touch the More button"
  step "I touch Done"
  step "I touch the Share button"
  step "I touch the Add button"
  step "I touch the Share button"
  step "I touch Copy"
  step "I touch the Share button"
  step "I touch the Read button"
  step "I touch Cancel"
  step "I touch the Share button"
  step "I touch Open"
  step 'I see the article from "news.ycombinator.com" in Safari'
  step 'I touch the "Back to news:yc" button in the header'
  step 'I touch the Share button'
  step 'I touch the More2 button'
  step 'I touch Done'
  step 'I touch Cancel'
end




