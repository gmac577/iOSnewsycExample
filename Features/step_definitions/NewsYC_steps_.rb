# encoding: utf-8

require 'calabash-cucumber/calabash_steps'
#require 'pretty_face'

#############################
########                    #
########  Login/Profile     #
########                    #
#############################

Given(/^I navigate to the login screen$/) do
  page(LoginPage).login_navigate
end
Given(/^I am on the Login screen$/) do
  page(LoginPage).await
end
Given(/^I have logged in successfully$/) do 
  page(LoginPage).login_success
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
  page(FeedDetailsPage).search_success
end
Given(/^I successfully submit (an URL|a Text)$/) do |post|
  page(FeedDetailsPage).post_success(post)
end
Given(/^I touch Share on the header$/) do
  page(FeedDetailsPage).touch_share
end
Given(/^I touch (Submit URL|Submit Text|Contents)$/) do |choice|
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
  page(MorePage).more_navigate
end
Given(/^I read all of the (Best Submissions|Active Discussions|archived submissions)$/) do |novel|
  page(MorePage).read_success(novel)
end
Given(/^I have logged in as a user$/) do
  page(MorePage).more_login
end
Given(/^I post a question$/) do
  page(MorePage).ask_post
end
Given(/^I have flagged a comment$/) do
  page(MorePage).flag_comment
end 
Given(/^I use the options on the tabbar$/) do
  page(MorePage).tab_options
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
  page(SubmissionPage).sub_navigate
end
Given(/^I successfully submit a post$/) do
  page(SubmissionPage).sub_post
end
Given(/^I succesfully flag a story$/) do
  page(SubmissionPage).sub_flag
end
Given(/^I navigte to a user's profile$/) do
 page(SubmissionPage).sub_view
end





