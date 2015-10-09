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

end