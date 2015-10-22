require 'calabash-cucumber/ibase'

class LoginPage < Calabash::IBase
      include PagePopulator	
      include FormHelper

def title
    "label {text LIKE '*Login*'}"
end

def await(opts={})
    sleeper(16)
    wait_for_elements_exist([title], :timeout => 3)
        self
end

@@username = "view marked:'Username'"
@@password = "view marked:'Password'"
@@cancel = "view marked:'Cancel'"
@@signin = "navigationButton index:1"
@@continue = "view marked: 'Continue'"
@@badprompt = "label {text LIKE 'Unable to Authenticate'}"


#######################################
####    Master Methods start here     #
####                                  #
####                                  #
####                                  #
#######################################

#-----------------------------------------------
#this is the method script for logins

def login_navigate
  page(FeedDetailsPage).await
  page(FooterTabBarPage).select_tab("Profile")
  page(LoginPage).await
end
#-----------------------------------------------
#this is the method script for successful login

def login_success
  page(FeedDetailsPage).await
  page(FooterTabBarPage).select_tab("Profile")
  page(LoginPage).await
  page(LoginPage).login("valid")
  page(FeedDetailsPage).await
end
#-----------------------------------------------


#######################################
####    Helper Methods start here     #
####                                  #
####                                  #
####                                  #
#######################################
def login(type)
	sleeper(16)
	touch(@@username)
	populate_page_with "#{type}"
  keyboard_enter_char("Return")
  sleeper(35)
end
#----------------------------------------------
def signin
  touch(@@signin)
end
#----------------------------------------------
def touch_cancel
  wait_for_elements_exist([@@cancel], :timeout => 10)
	touch(@@cancel)
	sleeper(16)
end
#----------------------------------------------
def touch_continue
  sleeper(16)
  wait_for_elements_exist([@@badprompt], :timeout => 10)
  touch(@@continue)
end
#----------------------------------------------
end