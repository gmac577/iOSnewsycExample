require 'calabash-cucumber/ibase'

class LoginPage < Calabash::IBase
      include PagePopulator	
      include FormHelper

def title
    "label {text LIKE '*Login*'}"
end

def await(opts={})
    wait_for_elements_exist([title], :timeout => 3)
        self
end

@@username = "view marked:'Username'"
@@password = "view marked:'Password'"
@@cancel = "view marked:'Cancel'"
@@signin = "navigationButton index:1"
@@continue = "view marked: 'Continue'"
@@badprompt = "label {text LIKE 'Unable to Authenticate'}"

def login(type)
	sleep 5
	touch(@@username)
	populate_page_with "#{type}"
  keyboard_enter_char("Return")
end

def signin
  touch(@@signin)
end

def touch_cancel
  wait_for_elements_exist([@@cancel], :timeout => 10)
	touch(@@cancel)
	sleep 2
end
def touch_continue
  sleep 4
  wait_for_elements_exist([@@badprompt], :timeout => 10)
  touch(@@continue)
end
end