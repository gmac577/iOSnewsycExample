require 'calabash-cucumber/ibase'

class FeedDetailsPage < Calabash::IBase

    include FormHelper
    include PagePopulator  

    def title
        "label {text LIKE '*Hacker News*'}"
    end
	def await(opts={})
		wait_for_elements_exist([title], :timeout => 10)
        self
    end

    @@feedtable = "tableViewCell'"
    @@storycell = "SubmissionTableCell"
    @@compose = "navigationButton index:0"
    @@story = "tableViewCell index:1"
   
    def verify_feed_elements
        wait_for_elements_exist([@@feedtable], :timeout => 10)
        wait_for_elements_exist([@@storycell], :timeout => 10)
        wait_for_elements_exist([@@compose], :timeout => 10)
    end

    def touch_row
         touch(@@story)
    end











end
