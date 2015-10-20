require 'calabash-cucumber/ibase'
require_relative 'mainfeedpage.rb'
require_relative 'footertabbar.rb'


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

#-----------------------------------------------
#these two functions take the place of the sleep function
#to inc/dec time, adjust the amount of microseconds when you call the "sleeper" function

def sleeper(clock)
  n = 0
  tm = clock
  every(0.1) do
    n += 1
    break if n == tm
  end
end

 def every(period)
    base = last = Time.now.to_f
    count = 0

    loop do
      now = Time.now.to_f
      actual_secs = now - base
      expected_secs = period * count
      correction = expected_secs - actual_secs
      correction = -period if correction < -period
      select(nil, nil, nil, period + correction)
      now = Time.now
      last = now.to_f
      count += 1
      yield(now)
    end
  end
#--------------------------------------------
#this is the method script for login

def login_master
  await
  select_tab(tab)
  await
  login(type)
  await
end

#--------------------------------------------
def login(type)
	sleeper(16)
	touch(@@username)
	populate_page_with "#{type}"
  keyboard_enter_char("Return")
  sleeper(35)
end

def signin
  touch(@@signin)
end

def touch_cancel
  wait_for_elements_exist([@@cancel], :timeout => 10)
	touch(@@cancel)
	sleeper(16)
end
def touch_continue
  sleeper(16)
  wait_for_elements_exist([@@badprompt], :timeout => 10)
  touch(@@continue)
end
end