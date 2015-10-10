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
Given(/^I can bla the bla bla bla-bla-bla$/) do 
  page(BlaOnePage).bla_bla_bla(bla)
end
Given(/^I touch the second post$/) do
  page(FeedDetailsPage).touch_row
end
#############################
########                    #
########  New Story Feed    #
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
########  The More Screen   #
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
Given(/^I create a reply post$/) do
  page(SubmissionPage).create_post
end
Given(/^I pause 5 seconds$/) do 
  page(SubmissionPage).pause
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



